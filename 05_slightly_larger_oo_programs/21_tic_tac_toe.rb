require "pry"

module Displayable

  YES = ['y', 'yes']
  NO = ['n', 'no']
  VALID_ANSWERS = YES + NO

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
end

class Board
  # WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
  #                        [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
  #                        [[1, 5, 9], [3, 5, 7]]
  # MIDDLE = 5

  def initialize
    # reset
  end

  # def []=(key, marker)
  #   @markers[key].marker = marker
  # end

  # def unmarked_keys
  #   @markers.keys.select { |key| @markers[key].unmarked? }
  # end

  # def full?
  #   unmarked_keys.empty?
  # end

  # def someone_won?
  #   !!winning_marker
  # end

  # def winning_marker
  #   WINNING_COMBINATIONS.each do |line|
  #     next if any_unmarked_key?(line)
  #     full_row = line.map { |num| @markers[num].marker }
  #     return full_row[0] if full_row.uniq.size == 1
  #   end
  #   nil
  # end

  # def reset
  #   @markers = (1..9).each_with_object({}) do |key, hash|
  #     hash[key] = Marker.new
  #   end
  # end

  # # rubocop:disable Metrics/AbcSize
  # # rubocop:disable Metrics/MethodLength
  # def draw
  #   puts "     |     |"
  #   puts "  #{@markers[1]}  |  #{@markers[2]}  |  #{@markers[3]}"
  #   puts "     |     |"
  #   puts "-----|-----|-----"
  #   puts "     |     |"
  #   puts "  #{@markers[4]}  |  #{@markers[5]}  |  #{@markers[6]}"
  #   puts "     |     |"
  #   puts "-----|-----|-----"
  #   puts "     |     |"
  #   puts "  #{@markers[7]}  |  #{@markers[8]}  |  #{@markers[9]}"
  #   puts "     |     |"
  # end
  # # rubocop:enable Metrics/AbcSize
  # # rubocop:enable Metrics/MethodLength

  # def immediate_move?
  #   !!move
  # end

  # def move(mrkr = COMPUTER_MARKER)
  #   2.times do
  #     WINNING_COMBINATIONS.each do |line|
  #       next unless one_unmarked_key?(line)
  #       markers = line.map { |num| @markers[num].marker }
  #       return line[markers.index(INITIAL_MARK)] if two?(markers, mrkr)
  #     end
  #     mrkr = @custom_marker
  #   end
  #   nil
  # end

  # private

  # def two?(markers, mrkr)
  #   markers.count(mrkr) == 2
  # end

  # def any_unmarked_key?(line)
  #   unmarked_keys.any? { |num| line.include?(num) }
  # end

  # def one_unmarked_key?(line)
  #   unmarked_keys.one? { |num| line.include?(num) }
  # end

  # def display_board
  #   puts "You are #{human.marker}, #{computer} is #{computer.marker}."
  #   puts ""
  #   puts "Best of #{Player::WIN} wins!"
  #   puts ""
  #   board.draw
  #   puts ""
  #   display_score
  #   puts ""
  # end
end

class Marker
  # INITIAL_MARK = ' '

  # attr_writer :custom_marker

  # attr_accessor :marker

  # def initialize(marker = INITIAL_MARK)
  #   @marker = marker
  #   @current_marker = nil
  # end

  # def to_s
  #   @marker
  # end

  # def unmarked?
  #   @marker == Board::INITIAL_MARK
  # end

end

class HumanMarker < Marker
  # DEFAULT_MARKER = 'X'

  # def initialize(marker = DEFAULT_MARKER)
  #   @marker = marker
  # end










end

class ComputerMarker < Marker
  # COMPUTER_MARKER = 'O'

  # def initialize(marker = COMPUTER_MARKER)
  #   @marker = marker
  # end
end

class Score
  def initialize
    @points = 0
  end

  # def num_to_win?
  #   score == WIN
  # end

  # def s_or_no_s
  #   score == 1 ? '' : 's'
  # end
end

class Player
  # WIN = 5

  attr_accessor :name #, :score 

  def initialize
    @score = Score.new
  end

  # def to_s
  #   name
  # end

  # def pick_beginning_player
  #   first = ''
  #   loop do
  #     puts "Choose who goes first!"
  #     puts "'p' for player, 'c' for computer, 'r' for random."
  #     first = gets.chomp.downcase.strip
  #     break if VALID_PICKS.include?(first)
  #     puts "Invalid choice!"
  #   end
  #   @current_marker = beginning_player(first)
  #   display_beginning_player
  # end

  # def beginning_player(first)
  #   if VALID_P.include?(first)
  #     human.marker
  #   elsif VALID_C.include?(first)
  #     Board::COMPUTER_MARKER
  #   else
  #     [human.marker, Board::COMPUTER_MARKER].sample
  #   end
  # end

  # def display_beginning_player
  #   if human_turn?
  #     puts "You begin!"
  #   else
  #     puts "#{computer} begins!"
  #   end

  #   pace_game(1)
  #   clear_screen
  # end

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

  # def display_score
  #   puts "You have #{human.score} point#{human.s_or_no_s}."
  #   puts "#{computer} has #{computer.score} point#{computer.s_or_no_s}."
  # end

  # def num_points?
  #   human.num_to_win? || computer.num_to_win?
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


  # def player_move
  #   loop do
  #     current_player_moves
  #     break if board.someone_won? || board.full?
  #     clear_screen_and_display_board if human_turn?
  #   end
  # end


  # def current_player_moves
  #   if human_turn?
  #     human_moves
  #     @current_marker = Board::COMPUTER_MARKER
  #   else
  #     computer_moves
  #     @current_marker = human.marker
  #   end
  # end
end

class Human < Player
  DEFAULT_AVATAR = "X"

  attr_accessor :avatar
  include Displayable

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



  # def human_moves
  #   puts "Choose a square:"
  #   puts joinor
  #   key = nil
  #   loop do
  #     key = gets.chomp.strip.to_i
  #     break if board.unmarked_keys.include?(key)
  #     puts "Invalid input!"
  #   end

  #   board[key] = human.marker
  # end

  # def joinor(separator = ', ', last = ' or ')
  #   choices = board.unmarked_keys.collect(&:to_s)

  #   case choices.size
  #   when 1
  #     choices.first
  #   when 2
  #     choices.join(last)
  #   else
  #     choices[0..-2].join(separator) + last + choices[-1]
  #   end
  # end

  # def human_turn?
  #   @current_marker == human.marker
  # end
end

class Computer < Player
  DEFAULT_AVATAR = "O"
  COMPUTER_NAMES = ['Hal', 'C3PO', 'R2D2', 'Marvin']
  
  def initialize(avatar = DEFAULT_AVATAR)
    super()
    @avatar = avatar
  end

  def choose_name
    self.name = COMPUTER_NAMES.sample
  end

  # def computer_moves
  #   if board.immediate_move?
  #     board[board.move] = Board::COMPUTER_MARKER
  #   elsif board.unmarked_keys.include?(MIDDLE)
  #     board[MIDDLE] = Board::COMPUTER_MARKER
  #   else
  #     board[board.unmarked_keys.sample] = Board::COMPUTER_MARKER
  #   end
  # end
end



# Orchestration engine
class TTTGame
  GAME = "Tic Tac Toe"

 
  # VALID_P = ['p', 'player']
  # VALID_C = ['c', 'computer']
  # VALID_R = ['r', 'random']
  # VALID_PICKS = VALID_P + VALID_C + VALID_R

  include Displayable

  attr_reader :game, :human, :computer#,  :board

  def initialize
    @game = GAME
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    clear_screen
    welcome_message
    handle_names
    handle_avatar 
    binding.pry
    # handle_marker
    # main_game
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

  def handle_marker
    board.custom_marker
  end

  # def main_game
  #   loop do
  #     pick_beginning_player
  #     best_of_num
  #     break unless play_again?
  #     reset
  #     display_play_again
  #   end
  # end

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

  # def best_of_num
  #   loop do
  #     display_board
  #     player_move
  #     add_score
  #     display_result
  #     break if num_points? || stop_playing?
  #     reset
  #   end
  #   display_final_winner
  #   reset_scores
  # end

  # def pace_game(time)
  #   Kernel.sleep(time)
  # end



  # def display_goodbye_message
  #   puts "Thank you for playing! Goobye #{human}!"
  # end

  # def clear_screen_and_display_board
  #   clear_screen
  #   display_board
  # end

  # def display_result
  #   clear_screen_and_display_board

  #   case board.winning_marker
  #   when human.marker
  #     puts "You win this game!"
  #   when computer.marker
  #     puts "#{computer} wins this game!"
  #   else
  #     puts "It's a tie!"
  #   end
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
