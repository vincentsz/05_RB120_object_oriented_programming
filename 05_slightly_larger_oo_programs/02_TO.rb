require 'pry'

class Participant
  attr_reader :hand

  def initialize
    @hand = []
    @points = 0
  end

  def show
    "#{@name} has "
  end

  # def hit(deck)
  #   deck.deal(@hand, 1)
  # end

  def joinand(separator = ', ', last = ' and ')
    case @hand.size
    when 2
      @hand.join(last)
    else
      @hand[0..-2].join(separator) + last + @hand[-1].to_s
    end
  end

  def stay
    puts "#{@name} stays, #{@name} has #{@points} points!"
  end

  def busts?
    @points > Game::MAXIMUM
  end

  def busts
    puts "Busted! #{@name} has #{@points} points!"
  end

  def total_points
    max_points = calculate_max_points
    if aces? 
      num_of_aces.times do
        break if max_points <= Game::MAXIMUM
        max_points -= 10  
      end
    end
    @points = max_points
  end

  def num_of_aces
    @hand.count do |card|
      card.value == 'ace'
    end
  end

  def calculate_max_points
    @hand.reduce(0){ |sum, card| sum + card.points }
  end

  def aces?
    @hand.any? do |card|
      card.value == 'ace'
    end
  end
end

class Player < Participant
  def initialize
    super()
    @name = 'Player'
  end

  def show
    puts super + joinand + "." 
  end

end

class Computer < Participant
  def initialize
    super()
    @name = 'Computer'
  end

  def initial_show
    puts "#{@name} has #{@hand.first}." 
  end

  def show
    puts super + joinand + "." 
  end
end

class Deck
  SUITS = ['clubs', 'diamonds', 'hearts', 'spades']
  VALUES = {'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9, 'ten' => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}

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
  HIT = ['h', 'hit']
  STAY = ['s', 'stay']
  VALID_ANSWERS = HIT + STAY

  def initialize
    @deck = Deck.new
    @player = Player.new
    @computer = Computer.new
  end

  def play
    deal_initial_cards
    show_initial_cards
    player_turn
    computer_turn
    binding.pry
    show_final result
  end

  def deal_initial_cards
    @deck.deal(@player.hand, INITIAL_DEAL)
    @deck.deal(@computer.hand, INITIAL_DEAL)
  end

  def show_initial_cards
    @player.show
    @computer.initial_show
  end

  def player_turn
    loop do
      @player.total_points
      break unless HIT.include?(choice_validation)
      @deck.deal(@player.hand, HIT_DEAL)
      @player.show
      @player.total_points
      return @player.busts if @player.busts?
    end
    @player.stay
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

  def computer_turn

  end
end

Game.new.play



