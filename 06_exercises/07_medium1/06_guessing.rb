class GuessingGame

  def initialize
    @guesses = 7
    @range = 1..100
    @number = nil
    @guessed = nil
    @guess = nil
  end

  def play
    reset
    loop do
      input_guess
      verify_guess
      decrement_guesses
      break if no_more_guesses? || @guessed
    end
    display_result
  end

  def reset
    @number = rand(@range)
    @guessed = false
    @guess = nil
  end

  def input_guess
    loop do
      puts "You have #{@guesses} guesses remaining."
      puts "Enter a number between #{@range.first} and #{@range.last}."
      @guess = gets.chomp.to_i
      break if valid_guess?
      puts "Invalid guess. Enter a number between 1 and 100."
    end
  end

  def valid_guess?
    @range.cover?(@guess)
  end

  def verify_guess
    result = @guess <=> @number
    case result
    when 0
      @guessed = true
      puts "That's the number!"
    when -1
      puts "You guessed too low!"
    else
      puts "You guessed too high!"
    end
  end

  def decrement_guesses
    @guesses -= 1
  end

  def no_more_guesses?
    @guesses == 0
  end

  def display_result
    if @guessed
      puts "You won!"
    else
      puts "You have no more guesses! The correct number was #{@number}."
    end 
  end
end

game = GuessingGame.new
game.play