require "pry"

module Displayable

  YES = ['y', 'yes']
  NO = ['n', 'no']
  VALID_ANSWERS = YES + NO
  VALID_P = ['p', 'player']
  VALID_C = ['c', 'computer']
  VALID_R = ['r', 'random']
  VALID_PICKS = VALID_P + VALID_C + VALID_R

  def clear_screen
    system("clear") || system("cls")
  end

  def welcome_message
    puts "Welcome to #{game}!"
    puts ""
  end

  def ask_name
    puts "What's your name?"
  end

  def invalid_input
    puts "Invalid answer!"
  end

  def display_names
    puts "You are playing #{computer.name} today!"
    puts "Good luck #{human.name}!"
  end

  def ask_custom_avatar
    puts "Do you want to choose a custom marker? ('y' / 'n')"
  end

  def display_choose_avatar
    puts "Choose a single character as your custom marker!"
    puts "'O' is reserved for the computer!"
  end

  def display_choice_avatar
    puts "You chose '#{human.avatar}' as your marker."
  end

  def display_beginning_player
    puts "#{current_player.name} begins!"
  end

  def display_board
    puts "You are #{human.avatar}, #{computer.name} is #{computer.avatar}."
    puts ""
    puts "Best of #{wins_game} wins!"
    puts ""
    draw
    puts ""
    display_scores
    puts ""
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def display_scores
    human.display_individual_score
    computer.display_individual_score
  end

  def display_individual_score
    puts "#{name} has #{score} point#{s_or_no_s}"
  end

  def s_or_no_s
    score == 1 ? '' : 's'
  end

  def choose_square
    puts "Choose a square:"
    puts joinor
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

  def clear_screen_and_display_board
    clear_screen
    display_board
  end
end

class Board
  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                         [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                         [[1, 5, 9], [3, 5, 7]]

  attr_accessor :markers, :human_marker, :computer_marker

  def initialize
    reset
  end

  def reset
    @markers = (1..9).each_with_object({}) do |key, hash|
      hash[key] = Square.new
    end
  end

  def[](key)
    @markers[key].marker
  end

  def []=(key, marker)
    @markers[key].marker = marker
  end

  def unmarked_keys
    markers.keys.select { |key| markers[key].unmarked? }
  end

  def immediate_move?
    !!move
  end

  def move(mrkr = computer_marker)
    2.times do
      WINNING_COMBINATIONS.each do |line|
        next unless one_unmarked_key?(line)
        markers = line.map { |num| @markers[num].marker }
        return line[markers.index(Square::INITIAL_MARKER)] if two?(markers, mrkr)
      end
      mrkr = human_marker
    end
    nil
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_COMBINATIONS.each do |line|
      next if any_unmarked_key?(line)
      full_row = line.map { |num| @markers[num].marker }
      return full_row[0] if full_row.uniq.size == 1
    end
    nil
  end

  def full?
    unmarked_keys.empty?
  end

  private

  def any_unmarked_key?(line)
    unmarked_keys.any? { |num| line.include?(num) }
  end

  def two?(markers, mrkr)
    markers.count(mrkr) == 2
  end

  def one_unmarked_key?(line)
    unmarked_keys.one? { |num| line.include?(num) }
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player

  include Displayable

  attr_accessor :name, :score 

  def initialize
    @score = 0
  end

  def num_to_win?
    score == WIN
  end

  # def reset_scores
  #   human.score = 0
  #   computer.score = 0
  # end

  # def add_score
  #   case board.winning_marker
  #   when human.marker
  #     human.score += 1
  #   when computer.marker
  #     computer.score += 1
  #   end
  # end



  # def display_final_winner
  #   if human.num_to_win?
  #     puts "You win best of #{Player::WIN}!"
  #   elsif computer.num_to_win?
  #     puts "#{computer} wins best of #{Player::WIN}!"
  #   else
  #     puts "Nobody wins, first player to reach #{Player::WIN} points wins!"
  #   end
  # end
end

class Human < Player
  DEFAULT_AVATAR = "X"

  attr_accessor :avatar

  def initialize(avatar = DEFAULT_AVATAR)
    super()
    @avatar = avatar
  end

  def choose_name
    choice = ''
    loop do
      ask_name
      choice = gets.chomp.strip
      break unless valid_name?(choice)
      invalid_input
    end
    self.name = choice
  end

  def valid_name?(choice)
    choice.empty? || Computer::COMPUTER_NAMES.any?(choice)
  end

  def customize_avatar?
    answer = ''
    loop do
      ask_custom_avatar
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      invalid_input
    end
    YES.include?(answer)
  end

  def choose_avatar
    choice = ''
    loop do
      display_choose_avatar
      choice = gets.chomp.strip
      break if valid_avatar?(choice)
      invalid_input
    end
    @avatar = choice
  end

  def valid_avatar?(choice)
    choice.size == 1 && choice != Computer::DEFAULT_AVATAR
  end

  # def choose_square
  #   square = nil
  #   loop do
  #     square = gets.chomp.strip.to_i
  #     break if square.available?
  #     puts "Invalid input!"
  #   end
  #   key
  # end

  def key_available?
    board.unmarked_keys.include?(key)
  end
end

class Computer < Player
  DEFAULT_AVATAR = "O"
  COMPUTER_NAMES = ['Hal', 'C3PO', 'R2D2', 'Marvin']

  attr_reader :avatar
  
  def initialize(avatar = DEFAULT_AVATAR)
    super()
    @avatar = avatar
  end

  def choose_name
    self.name = COMPUTER_NAMES.sample
  end
end

# Orchestration engine
class TTTGame
  GAME = "Tic Tac Toe"
  MIDDLE = 5

  include Displayable

  attr_reader :game, :human, :computer, :wins_game, :board
  attr_accessor :current_player

  def initialize
    @game = GAME
    @wins_game = 5
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    clear_screen
    welcome_message
    handle_names
    handle_avatar 
    handle_markers
    main_game

    # display_goodbye_message
  end

  private

  def handle_names
    human.choose_name
    computer.choose_name
    display_names # send names as parameters?
  end

  def handle_avatar
    human.choose_avatar if human.customize_avatar?
    display_choice_avatar
  end

  def handle_markers
    board.human_marker = human.avatar
    board.computer_marker = computer.avatar
  end

  def main_game
    loop do
      handle_beginning_player
      pace_game(1)
      clear_screen
      best_of_num 
      break unless play_again?
      reset
      display_play_again
    end
  end

  def handle_beginning_player
    pick_beginning_player
    display_beginning_player
  end

  def pick_beginning_player
    choice = ''
    loop do
      puts "Choose who goes first!"
      puts "'p' for player, 'c' for computer, 'r' for random."
      choice = gets.chomp.downcase.strip
      break if VALID_PICKS.include?(choice)
      invalid_input
    end
    self.current_player = beginning_player(choice)
  end

  def beginning_player(choice)
    if VALID_P.include?(choice)
      human
    elsif VALID_C.include?(choice)
      computer
    else
      [human, computer].sample
    end
  end

  def pace_game(time)
    Kernel.sleep(time)
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

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def current_player_moves
    if human_turn?
      human_move
      @current_player = computer
    else
      computer_move
      @current_player = human
    end
  end

  def human_turn?
    @current_player == human
  end

  def human_move
    board[human_choose_square] = human.avatar
  end

  def human_choose_square
    key = ''
    loop do
      puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
      key = gets.chomp.strip.to_i
      break if key_available?(key)
      invalid_input
    end
    key
  end

  def key_available?(key)
    board.unmarked_keys.include?(key)
  end

  def computer_move
    board[computer_choose_square] = computer.avatar
  end

  def computer_choose_square
    if board.immediate_move?
      board.move
    elsif board.unmarked_keys.include?(MIDDLE)
      MIDDLE
    else
      board.unmarked_keys.sample
    end
  end

  def add_score
    case board.winning_marker
    when human.avatar
      human.score += 1
    when computer.avatar
      computer.score += 1
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.avatar
      puts "You win this game!"
    when computer.avatar
      puts "#{computer} wins this game!"
    else
      puts "It's a tie!"
    end
  end

  def num_points?
    human.num_to_win? || computer.num_to_win?
  end

  # def play_again?
  #   answer = ''
  #   loop do
  #     puts "Do you want to play another best of #{Player::WIN}? ('y'/'n')"
  #     answer = gets.chomp.downcase.strip
  #     break if VALID_ANSWERS.include?(answer)
  #     puts "Invalid answer, please select 'y' or n'"
  #   end
  #   YES.include?(answer)
  # end

  # def display_goodbye_message
  #   puts "Thank you for playing! Goobye #{human}!"
  # end

  # def stop_playing?
  #   answer = ''
  #   loop do
  #     puts "Do you want to continue playing? ('y'/'n')"
  #     answer = gets.chomp.downcase.strip
  #     break if VALID_ANSWERS.include?(answer)
  #     puts "Invalid answer, please select 'y' or n''"
  #   end
  #   NO.include?(answer)
  # end

  # def reset
  #   board.reset
  #   clear_screen
  # end

  # def display_play_again
  #   puts "Let's play again!"
  #   puts ""
  # end
end

game = TTTGame.new
game.play
