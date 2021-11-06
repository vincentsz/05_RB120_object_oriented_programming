# -------- Classes ----------
class Player
  attr_accessor :choice, :name, :score, :history, :temp_moves

  WIN = 10

  def initialize
    set_name
    @score = 0
    @history = []
    @temp_moves = []
  end

  def add_score
    @score += 1
  end

  def ten_points?
    score == WIN
  end

  def each_game
    history.map.with_index do |game, idx|
      "-Game #{idx + 1}: #{game.join(', ')}."
    end
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp.strip
      break if valid_name?(n)
      puts "Sorry, invalid input."
    end
    self.name = n
  end

  def valid_name?(n)
    n != ''
  end

  def choose
    temp_choice = nil
    loop do
      puts "Choose rock, paper, scissors, lizard or spock:"
      temp_choice = convert_choice(gets.chomp.downcase)
      break if valid_choice?(temp_choice)
      puts "Sorry, invalid choice!"
    end
    self.choice = Choice.new(temp_choice, temp_moves)
  end

  def convert_choice(input)
    if ['r', 'p', 'sc', 'l', 'sp'].include?(input)
      valid_letter(input)
    elsif input == 's'
      puts "Specify #{Choice::MOVES[2]} (sc) or #{Choice::MOVES[4]} (sp)."
    else
      input
    end
  end

  def valid_letter(input)
    case input
    when 'r' then Choice::MOVES[0]
    when 'p' then Choice::MOVES[1]
    when 'sc' then Choice::MOVES[2]
    when 'l' then Choice::MOVES[3]
    when 'sp' then Choice::MOVES[4]
    end
  end

  def valid_choice?(choice)
    Choice::MOVES.include?(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal', 'C3PO', 'R2D2', 'Marvin'].sample
  end

  def choose
    self.choice = Choice.new(Choice::MOVES.sample, temp_moves)
  end
end

class Choice
  attr_accessor :choice

  RULES = {
    'rock' => ['paper', 'spock'],
    'paper' => ['scissors', 'lizard'],
    'scissors' => ['rock', 'spock'],
    'lizard' => ['rock', 'scissors'],
    'spock' => ['lizard', 'paper']
  }

  MOVES = RULES.keys

  def initialize(value, temp_moves)
    @choice = value
    temp_moves << @choice
  end

  def <(other)
    RULES[choice].include?(other.choice)
  end

  def to_s
    @choice
  end
end

# -------- Orchestration Engine ----------
class RPSGame
  attr_accessor :human, :computer, :winner

  def initialize
    display_welcome
    @human = Human.new
    @computer = Computer.new
    @winner = nil
  end

  def display_welcome
    puts "Welcome to rock, paper, scissors, lizard, spock!"
    puts "Best of 10 games wins!"
  end

  def display_name
    puts "Good luck #{human.name}!"
  end

  def display_choices
    puts "#{human.name} chose #{human.choice}."
    puts "#{computer.name} chose #{computer.choice}."
  end

  def handle_winner
    determine_winner
    display_winner
    handle_score
    display_score
  end

  def determine_winner
    @winner = if human.choice < computer.choice
                computer
              elsif computer.choice < human.choice
                human
              end
  end

  def display_winner
    if tie?
      puts "It's a tie!"
    else
      puts "#{@winner.name} won!"
    end
  end

  def display_goodbye_message
    puts "Goodbye #{human.name}!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? Yes or no?"
      answer = gets.chomp.downcase
      break if ['y', 'n', 'yes', 'no'].include?(answer)
      puts "Sorry, invalid choice."
    end
    ['y', 'yes'].include?(answer)
  end

  def tie?
    @winner.nil?
  end

  def handle_score
    @winner.add_score unless tie?
  end

  def display_score
    puts "#{human.name} has #{human.score} point#{add_s(human.score)}."
    puts "#{computer.name} has #{computer.score} point#{add_s(computer.score)}."
  end

  def add_s(score)
    score == 1 ? '' : 's'
  end

  def display_final_winner
    puts "#{human.name} has won this game." if human.ten_points?
    puts "#{computer.name} has won this game." if computer.ten_points?
  end

  def handle_end_ten_games
    display_final_winner
    send_moves_to_history
    display_history
    clear_moves
    clear_score
  end

  def pace_game(time)
    Kernel.sleep(time)
    clear_screen
  end

  def clear_score
    human.score = 0
    computer.score = 0
  end

  def send_moves_to_history
    human.history << human.temp_moves
    computer.history << computer.temp_moves
  end

  def clear_moves
    human.temp_moves = []
    computer.temp_moves = []
  end

  def display_history
    puts "#{human.name} has played:"
    puts human.each_game
    puts "#{computer.name} has played:"
    puts computer.each_game
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def ten_games
    loop do
      human.choose
      computer.choose
      display_choices
      handle_winner
      pace_game(3)
      next if tie?
      break if @winner.ten_points?
    end
    handle_end_ten_games
  end

  def play
    display_name
    pace_game(1)
    loop do
      ten_games
      pace_game(6)
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
