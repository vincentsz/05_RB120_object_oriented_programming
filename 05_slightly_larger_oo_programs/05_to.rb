module Displayable
  def display_welcome
    puts "Welcome to #{@game}!"
  end

  def display_goodbye
    puts "Thank you for playing #{@game}! See you next time"
  end

  def display_play_again
    puts "Let's play again!"
    puts ""
  end
end

module Interactive
  YES = ['y', 'yes']
  NO = ['n', 'no']
  VALID_ANSWERS = YES + NO

  def clear_screen
    system("clear") || system("cls")
  end

  def pace_game(time)
    Kernel.sleep(time)
  end

  def choose_player_name
    choice = ''
    loop do
      puts "What's your name?"
      choice = gets.chomp.strip
      break unless invalid_player_name?(choice)
      puts "Invalid input!"
    end
    choice
  end

  def invalid_player_name?(choice)
    choice.empty? || Computer::NAMES.any?(choice)
  end

  def choose_computer_name
    Computer::NAMES.sample
  end

  def play_again?
    answer = ''
    loop do
      puts "Do you want to play another best of #{Game::WIN}? ('y'/'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n'"
    end
    YES.include?(answer)
  end
end

class Participant
  attr_reader :hand, :points, :busted
  attr_accessor :name

  def initialize
    @hand = []
    @points = 0
    @busted = false
  end

  def to_s
    name
  end

  def show
    "#{@name} has "
  end

  def joinand(separator = ', ', last = ' and ')
    case @hand.size
    when 2
      @hand.join(last)
    else
      @hand[0..-2].join(separator) + last + @hand[-1].to_s
    end
  end

  def display_hit
    puts "#{@name} hits!"
  end

  def stay
    puts "#{@name} stays, #{@name} has #{@points} points!"
  end

  def handle_bust
    @busted = true if @points > Game::MAXIMUM
  end

  def display_bust
    puts "#{@name} busted! #{@name} has #{@points} points!"
  end

  def total_points
    max_points = max_sum_points
    if aces?
      num_of_aces.times do
        break if max_points <= Game::MAXIMUM
        max_points -= 10
      end
    end
    @points = max_points
  end

  def max_sum_points
    @hand.reduce(0) { |sum, card| sum + card.points }
  end

  def aces?
    @hand.any? { |card| card.value == 'ace' }
  end

  def num_of_aces
    @hand.count { |card| card.value == 'ace' }
  end

  def display_win
    puts "#{@name} wins the game!"
  end

  def display_final_points(other)
    puts "#{@name} has #{@points} points."
    puts "#{other.name} has #{other.points} points."
  end

  def >(other)
    points > other.points
  end

  def reset
    @hand = []
    @points = 0
    @busted = false
  end
end

class Player < Participant
  HIT = ['h', 'hit']
  STAY = ['s', 'stay']
  VALID_ANSWERS = HIT + STAY

  def show
    puts super + joinand + "."
  end

  def choice_validation
    choice = ''
    loop do
      puts "Do you want to hit or stay?('h'/'s')"
      choice = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(choice)
      puts "Invalid input!"
    end
    choice
  end
end

class Computer < Participant
  MINIMUM = 17
  NAMES = ['Hal', 'C3PO', 'R2D2', 'Marvin']

  def initial_show
    puts "#{@name} has #{@hand.first}."
  end

  def show
    puts super + joinand + "."
  end
end

class Deck
  SUITS = ['clubs', 'diamonds', 'hearts', 'spades']
  VALUES = {
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9,
    'ten' => 10,
    'jack' => 10,
    'queen' => 10,
    'king' => 10,
    'ace' => 11
  }

  attr_reader :cards

  def initialize
    @cards = build
  end

  def build
    SUITS.each_with_object([]) do |suit, collection|
      VALUES.each do |value, points|
        collection << Card.new(value, suit, points)
      end
    end
  end

  def deal(hand, num)
    num.times do
      hand << @cards.sample
      @cards.delete(hand.last)
    end
  end
end

class Card
  attr_reader :value, :points

  def initialize(value, suit, points)
    @name = a_or_an(value) + value + ' of ' + suit
    @suit = suit
    @value = value
    @points = points
  end

  def to_s
    @name
  end

  def a_or_an(val)
    ["a", "e", "i", "o", "u"].include?(val.chr) ? "an " : "a "
  end
end

class Game
  INITIAL_DEAL = 2
  HIT_DEAL = 1
  MAXIMUM = 21
  WIN = 5

  include Displayable
  include Interactive

  def initialize
    @game = "Twenty-one"
    @deck = Deck.new
    @player = Player.new
    @computer = Computer.new
  end

  def play
    display_welcome
    handle_screen(1)
    display_rules
    handle_screen(5)
    handle_names
    loop do
      handle_screen(2)
      main_game
      break unless play_again?
      reset_game
      display_play_again
    end
    display_goodbye
  end

  def handle_screen(time)
    pace_game(time)
    clear_screen
  end

  def display_rules
    puts "The player who scores the closest to 21 wins."
    puts "If you go over 21, you bust!"
    puts "The numbers 2 through 10 are worth their face value."
    puts "The jack, queen, and king are each worth 10."
    puts "The ace can be worth 1 or 11."
  end

  def handle_names
    input_names
    display_names
  end

  def input_names
    @player.name = choose_player_name
    @computer.name = choose_computer_name
  end

  def display_names
    puts "You are playing #{@computer} today!"
    puts "Good luck #{@player}!"
  end

  def main_game
    deal_initial_cards
    show_initial_cards
    player_turn
    handle_screen(4)
    unless @player.busted 
      computer_turn 
      handle_screen(4)
    end
    show_final_result
  end

  def deal_initial_cards
    @deck.deal(@player.hand, INITIAL_DEAL)
    @deck.deal(@computer.hand, INITIAL_DEAL)
    @player.total_points
    @computer.total_points
  end

  def show_initial_cards
    @player.show
    @computer.initial_show
  end

  def player_turn
    loop do
      break unless Player::HIT.include?(@player.choice_validation)
      player_moves
      return @player.display_bust if @player.busted
    end
    @player.stay
  end

  def player_moves
    @player.display_hit
    handle_screen(2)
    @deck.deal(@player.hand, HIT_DEAL)
    @player.show
    @player.total_points
    @player.handle_bust
  end

  def computer_turn
    @computer.show
    handle_screen(4)
    loop do
      break if @computer.points >= Computer::MINIMUM && @computer.points > @player.points
      computer_moves
      return @computer.display_bust if @computer.busted
    end
    @computer.stay
  end

  def computer_moves
    @computer.display_hit
    handle_screen(2)
    @deck.deal(@computer.hand, HIT_DEAL)
    @computer.show
    @computer.total_points
    @computer.handle_bust
  end

  def show_final_result
    if @player.busted
      @computer.display_win
    elsif @computer.busted
      @player.display_win
    else
      determine_winner
    end
  end

  def determine_winner
    @player.display_final_points(@computer)

    if @player > @computer
      @player.display_win
    elsif @computer > @player
      @computer.display_win
    else
      puts "It's a tie!"
    end
  end

  def reset_game
    @deck = Deck.new
    @player.reset
    @computer.reset
  end
end

Game.new.play
