# Using the Card class from the previous exercise, 
# create a Deck class that contains all of the standard 52 playing cards. 
# Use the following code to start your work:


class Deck
  attr_reader :deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    shuffle_deck
  end

  def draw
    shuffle_deck if deck.empty?
    deck.pop
  end

  private

  def shuffle_deck
    @deck = RANKS.each_with_object([]) do |rank, collection|
      SUITS.each do |suit|
        collection << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  # VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze
  # SUITS = ['Diamonds', 'Clubs', 'Hearts', 'Spades'].freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  # def <=>(other)
  #   result = VALUES.index(rank) <=> VALUES.index(other.rank)
  #   # if result == 0
  #   #   return SUITS.index(suit) <=> SUITS.index(other.suit) 
  #   # end
  #   result
  # end
end


# The Deck class should provide a #draw method to deal one card. 
# The Deck should be shuffled when it is initialized and, if it runs out of cards, 
# it should reset itself by generating a new set of 52 shuffled cards.

# Examples:

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.

# Note that the last line should almost always be true; 
# if you shuffle the deck 1000 times a second, 
# you will be very, very, very old before you see two consecutive shuffles produce the same results. 
# If you get a false result, you almost certainly have something wrong.