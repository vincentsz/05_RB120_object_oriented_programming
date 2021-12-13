class Board
  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                         [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                         [[1, 5, 9], [3, 5, 7]]

  attr_reader :squares

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

  def winning_marker
    WINNING_COMBINATIONS.each do |line|
      next if unmarked_key_in_line?(line)
      full_row = line.map { |num| squares[num].marker }
      return full_row[0] if full_row.uniq.size == 1
    end
    nil
  end

  private

  def unmarked_key_in_line?(line)
    unmarked_keys.any? { |num| line.include?(num) }
  end
end

class Square
  INITIAL_MARK = ' '

  attr_accessor :marker

  def unmarked?
    @marker == INITIAL_MARK
  end

  private

  def initialize(marker = INITIAL_MARK)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  private

  def initialize(marker)
    @marker = marker
  end
end

# Orchestration engine
class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  YES = ['y', 'yes']
  NO = ['n', 'no']
  VALID_ANSWERS = YES + NO
  FIRST_TO_MOVE = HUMAN_MARKER

  def play
    clear_screen
    display_welcome_message
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break unless play_again?
      reset
      display_play_again
    end
    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
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
    @current_marker = FIRST_TO_MOVE
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

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end
end

game = TTTGame.new
game.play
