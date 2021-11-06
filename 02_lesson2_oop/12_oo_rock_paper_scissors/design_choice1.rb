# -------- Step1 ----------
# Rps is a two player game, where each player chooses one of three possible moves; rock, paper, scissors. 
# The moves are then compared and a winner is decided according to the following rules:
# - Rock beats scissors
# - Paper beats rock
# - Scissors beat paper

# If players choose same move, it's a tie

# -------- Step2 ----------
# Nouns: player, move, rule
# Verbs: choose, compare

# -------- Step3 ----------
# player
#   -choose
# move
# rule

# -compare

# -------- Step4 ----------
# also think about what states the objects of these classes should have
class Player
  attr_accessor :choice, :name

  def initialize
    set_name
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
    self.choice = temp_choice
  end

  def valid_choice?(choice)
    ['rock', 'paper', 'scissors'].include?(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal', 'C3PO', 'R2D2', 'Marvin'].sample
  end

  def choose
    self.choice = ['rock', 'paper', 'scissors'].sample
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

  def display_winner
    puts "#{human.name} chose #{human.choice}."
    puts "#{computer.name} chose #{computer.choice}."

    case human.choice
    when "rock"
      puts "#{human.name} won!" if computer.choice == "scissors"
      puts "#{computer.name} wins!" if computer.choice == "paper"
      puts "It's a tie!" if computer.choice == "rock"
    when "paper"
      puts "#{human.name} won!" if computer.choice == "rock"
      puts "#{computer.name} wins!" if computer.choice == "scissors"
      puts "It's a tie!" if computer.choice == "paper"
    else
      puts "#{human.name} won!" if computer.choice == "paper"
      puts "#{computer.name} wins!" if computer.choice == "rock"
      puts "It's a tie!" if computer.choice == "scissors"
    end
  end

  def display_goodbye_message
    puts"Goodbye #{human.name}"
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

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

end

RPSGame.new.play
