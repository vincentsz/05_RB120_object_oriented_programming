class Player
  attr_accessor :choice, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def add_score
    self.score += 1
  end

end

class Choice
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors']

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

  def <(other)
    if rock?
      other.paper?
    elsif paper?
      other.scissors?
    elsif scissors?
      other.rock?
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
      puts "Choose rock, paper or scissors:"
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
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "welcome #{human.name}!"
  end

  def display_choices
    puts "#{human.name} chose #{human.choice}."
    puts "#{computer.name} chose #{computer.choice}."
  end

  def display_winner
    if human.choice < computer.choice
      computer.add_score
      puts "#{computer.name} wins!"
    elsif computer.choice < human.choice
      human.add_score
      puts "#{human.name} won!"
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

  def display_score
    puts "#{human.name} has #{human.score} points."
    puts "#{computer.name} has #{computer.score} points."
  end

  def ten_points?
    human.score == 10 || computer.score == 10
  end

  def display_final_winner
    puts "#{human.name} has won the game." if human.score == 10
    puts "#{computer.name} has won the game." if computer.score == 10
  end

  def play
    display_welcome_message
    loop do #play again loop
      loop do #10 wins loop
        human.choose
        computer.choose
        display_choices
        display_winner
        display_score
        break if ten_points?
      end
      display_final_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
