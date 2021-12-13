require "pry"
class Board
  INITIAL_MARK = ' '
  DEFAULT_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                         [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                         [[1, 5, 9], [3, 5, 7]]

  attr_writer :custom_marker

  def initialize
    @custom_marker = DEFAULT_MARKER
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

  def move(mrkr = COMPUTER_MARKER)
    2.times do
      WINNING_COMBINATIONS.each do |line|
        next unless one_unmarked_key?(line)
        markers = line.map { |num| @squares[num].marker }
        return line[markers.index(INITIAL_MARK)] if two?(markers, mrkr)
      end
      mrkr = @custom_marker
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
  attr_accessor :marker

  def initialize(marker = Board::INITIAL_MARK)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    @marker == Board::INITIAL_MARK
  end
end

class Player
  WIN = 5
  COMPUTER_NAMES = ['Hal', 'C3PO', 'R2D2', 'Marvin']

  attr_accessor :marker, :score, :name

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def num_to_win?
    score == WIN
  end

  def s_or_no_s
    score == 1 ? '' : 's'
  end

  def to_s
    name
  end
end

class Human < Player
  def choose_name
    choice = ''
    loop do
      puts "What's your name?"
      choice = gets.chomp.strip
      break unless valid_name?(choice)
      puts "Invalid input!"
    end
    self.name = choice
  end

  def valid_name?(choice)
    choice.empty? || COMPUTER_NAMES.any?(choice)
  end
end

class Computer < Player
  def choose_name
    self.name = COMPUTER_NAMES.sample
  end
end

# Orchestration engine
class TTTGame
  YES = ['y', 'yes']
  NO = ['n', 'no']
  VALID_ANSWERS = YES + NO
  MIDDLE = 5
  VALID_P = ['p', 'player']
  VALID_C = ['c', 'computer']
  VALID_R = ['r', 'random']
  VALID_PICKS = VALID_P + VALID_C + VALID_R

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new(Board::DEFAULT_MARKER)
    @computer = Computer.new(Board::COMPUTER_MARKER)
    @current_marker = nil
  end

  def play
    clear_screen
    display_welcome_message
    handle_names
    customize_marker if customize_marker?
    main_game
    display_goodbye_message
  end

  private
  def handle_names
    human.choose_name
    computer.choose_name
    display_names
  end

  def display_names
    puts "You are playing #{computer} today!"
    puts "Good luck #{human}!"
  end

  def customize_marker?
    answer = ''
    loop do
      puts "Do you want to choose a custom marker? ('y' / 'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n'"
    end
    YES.include?(answer)
  end

  def customize_marker
    human.marker = choose_marker
    board.custom_marker = human.marker
    display_choice_marker
  end

  def choose_marker
    custom_marker = ''
    loop do
      puts "Choose a single character as your custom marker!"
      puts "'O' is reserved for the computer!"
      custom_marker = gets.chomp.strip
      break if valid_marker?(custom_marker)
      puts "Invalid input!"
    end
    custom_marker
  end

  def valid_marker?(custom_marker)
    custom_marker.size == 1 && custom_marker != Board::COMPUTER_MARKER
  end

  def display_choice_marker
    puts "You chose '#{human.marker}' as your custom marker."
  end

  def main_game
    loop do
      pick_beginning_player
      best_of_num
      break unless play_again?
      reset
      display_play_again
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Do you want to play another best of #{Player::WIN}? ('y'/'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n'"
    end
    YES.include?(answer)
  end

  def best_of_num
    loop do
      display_board
      player_move
      add_score
      display_result
      break if num_points? || stop_playing?
      reset
    end
    display_final_winner
    reset_scores
  end

  def pick_beginning_player
    first = ''
    loop do
      puts "Choose who goes first!"
      puts "'p' for player, 'c' for computer, 'r' for random."
      first = gets.chomp.downcase.strip
      break if VALID_PICKS.include?(first)
      puts "Invalid choice!"
    end
    @current_marker = beginning_player(first)
    display_beginning_player
  end

  def beginning_player(first)
    if VALID_P.include?(first)
      human.marker
    elsif VALID_C.include?(first)
      Board::COMPUTER_MARKER
    else
      [human.marker, Board::COMPUTER_MARKER].sample
    end
  end

  def display_beginning_player
    if human_turn?
      puts "You begin!"
    else
      puts "#{computer} begins!"
    end

    pace_game(1)
    clear_screen
  end

  def pace_game(time)
    Kernel.sleep(time)
  end

  def display_final_winner
    if human.num_to_win?
      puts "You win best of #{Player::WIN}!"
    elsif computer.num_to_win?
      puts "#{computer} wins best of #{Player::WIN}!"
    else
      puts "Nobody wins, first player to reach #{Player::WIN} points wins!"
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
    puts "#{computer} has #{computer.score} point#{computer.s_or_no_s}."
  end

  def num_points?
    human.num_to_win? || computer.num_to_win?
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
    puts ""
  end

  def display_goodbye_message
    puts "Thank you for playing! Goobye #{human}!"
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "You are #{human.marker}, #{computer} is #{computer.marker}."
    puts ""
    puts "Best of #{Player::WIN} wins!"
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
      board[board.move] = Board::COMPUTER_MARKER
    elsif board.unmarked_keys.include?(MIDDLE)
      board[MIDDLE] = Board::COMPUTER_MARKER
    else
      board[board.unmarked_keys.sample] = Board::COMPUTER_MARKER
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = Board::COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You win this game!"
    when computer.marker
      puts "#{computer} wins this game!"
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
    clear_screen
  end

  def display_play_again
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
