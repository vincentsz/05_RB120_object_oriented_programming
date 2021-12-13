#------Description-------

# Tic tac toe is a 2 player board game, played on a 3x3 grid. 
# Players take turns marking a square.
# The first player marking three squares in a row wins.

#------Verbs & nouns-------
# Nouns: 
#   -player
#   -board
#   -grid
#   -square
#   -row?
# Verbs:
#   -mark
#   -play

#------Organized-------
# -player
#   -play
#   -mark
# -board
# -square

#------Spike-------
require "pry"

class Board
  attr_reader :squares

  WINNING_COMBINATIONS = [
    [1, 2, 3], [4, 5, 6], [7, 8 ,9],
     [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]
    ]

  def initialize
    reset
  end

  def draw
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts "     |     |"
  end

  def reset
    @squares = (1..9).each_with_object({}) do |key, hash|
      hash[key] = Square.new
    end
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

  # def winning_marker
  #   WINNING_COMBINATIONS.each do |line|
  #     if line.all? { |num| squares[num].marker == TTTGame::HUMAN_MARKER }
  #       return TTTGame::HUMAN_MARKER
  #     elsif line.all? { |num| squares[num].marker == TTTGame::COMPUTER_MARKER }
  #       return TTTGame::COMPUTER_MARKER
  #     end
  #   end
  #   nil
  # end

  # def winning_marker
  #   WINNING_COMBINATIONS.each do |line|
  #     row = line.map { |num| squares[num].marker }
  #     return row[0] if row.uniq.size == 1 && row[0] != Square::INITIAL_MARK
  #   end
  #   nil
  # end
  def unmarked_key_in_line?(line)
    unmarked_keys.any?{ |num| line.include?(num) }
  end

  def winning_marker
    WINNING_COMBINATIONS.each do |line|
      next if unmarked_key_in_line?(line)
      row = line.map{ |num| squares[num].marker }
      return row[0] if row.uniq.size == 1
    end
    nil
  end
  
#   def fully_marked_lines(line)
#     line.none? do |num|
#       unmarked_keys.include?(num)
#     end
#   end

#   def winning_marker
#     full_lines = WINNING_COMBINATIONS.select do |line|
#       fully_marked_lines(line)
#     end
#     full_lines.each do |line|
#       squares.values_at(*line).marker
# binding.pry
#   end
end

class Square
  attr_accessor :marker
  INITIAL_MARK = ' '

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
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

# Orchestration engine
class TTTGame
  attr_reader :board, :human, :computer
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  YES = ['y', 'yes']
  NO = ['n', 'no']
  VALID_ANSWERS = YES + NO

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')})."
    key = nil
    loop do
      key = gets.chomp.to_i
      break if board.unmarked_keys.include?(key)
      puts "Invalid input! (valid squares: #{board.unmarked_keys.join(', ')})"
    end
    
    board[key] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when HUMAN_MARKER
      puts "You won!"
    when COMPUTER_MARKER
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thank you for playing! Goobye!"
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def play_again? # should return true if you want to play again
    answer = ''
    loop do
      puts "Do you want to play again? ('y'/'n')"
      answer = gets.chomp.downcase
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n''"
    end
    YES.include?(answer)
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def reset
    board.reset
    clear_screen
  end

  def display_play_again
    puts "Let's play again!"
    puts ""
  end

  def display_board
    puts "You are #{human.marker}, computer is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def play
    clear_screen
    display_welcome_message
    loop do #play again loop
      display_board
      loop do
        human_moves
        break if board.full? || board.someone_won?
        computer_moves
        break if board.full? || board.someone_won?
        clear_screen_and_display_board
      end
      display_result
      break unless play_again?
      reset
      display_play_again
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
