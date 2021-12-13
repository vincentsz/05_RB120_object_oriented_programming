require "pry"
class Board
  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                         [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                         [[1, 5, 9], [3, 5, 7]]

  def initialize
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_COMBINATIONS.each do |line|
      next if any_unmarked_key?(line)
      full_row = line.map { |num| @squares[num].marker }
      return full_row[0] if full_row.uniq.size == 1
    end
    nil
  end

  def reset
    @squares = (1..9).each_with_object({}) do |key, hash|
      hash[key] = Square.new
    end
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def immediate_move?
    !!move
  end

  def move(mrkr = TTTGame::COMPUTER_MARKER)
    2.times do
      WINNING_COMBINATIONS.each do |line|
        next unless one_unmarked_key?(line)
        markers = line.map { |num| @squares[num].marker }
        return line[markers.index(Square::INITIAL_MARK)] if two?(markers, mrkr)
      end
      mrkr = TTTGame.custom_marker # class instance?
    end
    nil
  end

  private

  def two?(markers, mrkr)
    markers.count(mrkr) == 2
  end

  def any_unmarked_key?(line)
    unmarked_keys.any? { |num| line.include?(num) }
  end

  def one_unmarked_key?(line)
    unmarked_keys.one? { |num| line.include?(num) }
  end
end

class Square
  INITIAL_MARK = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARK)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    @marker == INITIAL_MARK
  end
end

class Player
  attr_accessor :marker, :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def five?
    score == 5
  end

  def s_or_no_s
    score == 1 ? '' : 's'
  end
end

# Orchestration engine
class TTTGame
  DEFAULT_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  YES = ['y', 'yes']
  NO = ['n', 'no']
  VALID_ANSWERS = YES + NO
  # FIRST_TO_MOVE = @human_marker
  MIDDLE = 5
  VALID_P = ['p', 'player']
  VALID_C =  ['c', 'computer']
  VALID_R = ['r', 'random']
  VALID_PICKS = VALID_P + VALID_C + VALID_R

  attr_reader :board, :computer
  attr_accessor :human

  @@custom_marker = DEFAULT_MARKER

  def initialize
    @board = Board.new
    @human = Player.new(@@custom_marker)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = nil
  end

  def play
    clear_screen
    display_welcome_message
    pick_marker if pick_marker?
    main_game
    display_goodbye_message
  end

  def self.custom_marker
    @@custom_marker
  end

  private

  def pick_marker?
    answer = ''
    loop do
      puts "Do you want to pick a custom marker? ('y' / 'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n'"
    end
    YES.include?(answer)
  end

  def pick_marker
    custom_marker = ''
    loop do
      puts "Choose one character as your custom marker!"
      custom_marker = gets.chomp.strip
      break if custom_marker.size == 1
      puts "Invalid input!"
    end
    @@custom_marker = custom_marker
    human.marker = @@custom_marker

  end

  def main_game
    loop do
      pick_beginning_player
      best_of_five
      break unless play_again?
      reset
      display_play_again
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Do you want to play another best of five? ('y'/'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n'"
    end
    YES.include?(answer)
  end

  def best_of_five
    loop do
      display_board
      # pick_beginning_player
      player_move
      add_score
      display_result
      break if five_points? || stop_playing?
      reset
    end
    display_final_winner
    reset_scores
  end

  def pick_beginning_player
    first = ''
    loop do
      puts "Choose who can go first! ('p' for player, 'c' for computer, 'r' for random)"
      first = gets.chomp.downcase.strip
      break if VALID_PICKS.include?(first)
      puts "Invalid choice!"
    end
    set_beginning_player(first)
    display_beginning_player
  end

  def set_beginning_player(first)
    if VALID_P.include?(first)
      @current_marker = @@custom_marker
    elsif VALID_C.include?(first)
      @current_marker = COMPUTER_MARKER
    else
      @current_marker = [@@custom_marker, COMPUTER_MARKER].sample
    end
  end

  def display_beginning_player
    if human_turn?
      puts "You begin!"
    else
      puts "Computer begins!"
      
    end
    pace_game(2)
    clear_screen
  end

  def pace_game(time)
    Kernel.sleep(time)
  end

  def display_final_winner
    if human.five?
      puts "You win best of five!"
    elsif computer.five?
      puts "Computer wins best of five!"
    else
      puts "Nobody wins, first player to reach five points wins!"
    end
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def add_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer.marker
      computer.score += 1
    end
  end

  def display_score
    puts "You have #{human.score} point#{human.s_or_no_s}."
    puts "Computer has #{computer.score} point#{computer.s_or_no_s}."
  end

  def five_points?
    human.five? || computer.five?
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "Best of five wins!"
    puts ""
  end

  def display_goodbye_message
    puts "Thank you for playing! Goobye!"
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def human_turn?
    @current_marker == @@custom_marker
  end

  def display_board
    puts "You are #{human.marker}, computer is #{computer.marker}."
    puts ""
    board.draw
    puts ""
    display_score
    puts ""
  end

  def human_moves
    puts "Choose a square:"
    puts joinor
    key = nil
    loop do
      key = gets.chomp.strip.to_i
      break if board.unmarked_keys.include?(key)
      puts "Invalid input!"
    end

    board[key] = human.marker
  end

  def joinor(separator = ', ', last = ' or ')
    choices = board.unmarked_keys.collect(&:to_s)

    case choices.size
    when 1
      choices.first
    when 2
      choices.join(last)
    else
      choices[0..-2].join(separator) + last + choices[-1]
    end
  end

  def computer_moves
    if board.immediate_move?
      board[board.move] = computer.marker
    elsif board.unmarked_keys.include?(MIDDLE)
      board[MIDDLE] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = @@custom_marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You win this game!"
    when computer.marker
      puts "Computer wins this game!"
    else
      puts "It's a tie!"
    end
  end

  def stop_playing?
    answer = ''
    loop do
      puts "Do you want to continue playing? ('y'/'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n''"
    end
    NO.include?(answer)
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def reset
    board.reset
    # @current_marker = FIRST_TO_MOVE
    clear_screen
  end

  def display_play_again
    puts "Let's play again, best of five wins!"
    puts ""
  end
end

game = TTTGame.new
game.play
