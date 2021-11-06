class Player
  attr_accessor :choice, :name, :score

  WIN = 10

  def initialize
    set_name
    @score = 0
  end

  def add_score
    @score += 1
  end

  def ten_points?
    score == WIN
  end
end

class Choice
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def scissors?
    value == 'scissors'
  end

  def lizard?
    value == 'lizard'
  end

  def spock?
    value == 'spock'
  end

  def <(other)
    if rock?
      other.paper? || other.spock?
    elsif paper?
      other.scissors? || other.lizard?
    elsif scissors?
      other.rock? || other.spock?
    elsif lizard?
      other.rock? || other.scissors?
    elsif spock?
      other.lizard? || other.paper?
    end
  end

  def to_s
    value
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
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
      temp_choice = gets.chomp
      break if valid_choice?(temp_choice)
      puts "Sorry invalid choice!"
    end
    self.choice = Choice.new(temp_choice)
  end

  def valid_choice?(choice)
    Choice::VALUES.include?(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal', 'C3PO', 'R2D2', 'Marvin'].sample
  end

  def choose
    self.choice = Choice.new(Choice::VALUES.sample)
  end
end

# -------- Orchestration Engine ----------
class RPSGame
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
    @winner = nil
  end

  def display_welcome_message
    puts "welcome #{human.name}!"
  end

  def display_choices
    puts "#{human.name} chose #{human.choice}."
    puts "#{computer.name} chose #{computer.choice}."
  end

  def handle_winner
    determine_winner
    display_winner
  end

  def determine_winner
    if human.choice < computer.choice
      @winner = computer
    elsif computer.choice < human.choice
      @winner = human
    else
      @winner = nil
    end
  end

  def display_winner
    if @winner == computer
      puts "#{@winner.name} wins!"
    elsif @winner == human
      puts "#{@winner.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Goodbye #{human.name}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? Press 'y' or 'n'."
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, invalid choice."
    end
    answer == 'y'
  end

  def handle_score
    @winner.add_score unless @winner.nil?
    display_score
  end

  def display_score
    puts "#{human.name} has #{human.score} points."
    puts "#{computer.name} has #{computer.score} points."
  end

  def display_final_winner
    puts "#{human.name} has won the game." if human.ten_points?
    puts "#{computer.name} has won the game." if computer.ten_points?
  end

  def ten_games
    loop do # 10 wins loop
      human.choose
      computer.choose
      display_choices
      handle_winner
      handle_score
      next if @winner.nil?
      break if @winner.ten_points?
    end
  end

  def play
    display_welcome_message
    loop do # play again loop
      ten_games
      display_final_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
