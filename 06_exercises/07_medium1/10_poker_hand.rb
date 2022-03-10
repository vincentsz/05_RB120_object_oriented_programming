class Card
  include Comparable
  attr_reader :rank, :suit, :score

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @score = create_score
  end

  def create_score
      Deck::RANKS.index(rank) + 2
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

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

class PokerHand
  attr_reader :cards, :deck, :scores

  def initialize(deck)
    @deck = deck
    @cards = []
    deal_cards
    @scores = sort_scores
  end

  def deal_cards
    1.upto(5) do
      cards << deck.draw
    end
  end

  def print
    puts cards
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    # A, K, Q, J, 10, all the same suit. 
    scores == [10, 11, 12, 13, 14] && same_suit
  end

  def straight_flush?
    # Five cards in a sequence, all in the same suit.
    # booleans = scores.map.with_index { |score, idx| score == scores[idx + 1] } && same_suit
    booleans = []
    counter = 0
    loop do 
      booleans << (scores[counter] == (scores[counter + 1] - 1))
      counter += 1
      break if counter == 4
    end
    booleans.all?{ |bool| bool} && same_suit
  end

  def four_of_a_kind?
    # All four cards of the same rank. 
    [scores.count(scores[0]), scores.count(scores[-1])].sort == [1, 4]
  end

  def full_house?
    # Three of a kind with a pair. 
    [scores.count(scores[0]), scores.count(scores[-1])].sort == [2, 3]

  end

  def flush?
    # Any five cards of the same suit, but not in a sequence. 
    same_suit
  end

  def straight?
    # Five cards in a sequence, but not of the same suit.
    booleans = []
    counter = 0
    loop do 
      booleans << (scores[counter] == (scores[counter + 1] - 1))
      counter += 1
      break if counter == 4
    end
    booleans.all?{ |bool| bool}
  end

  def three_of_a_kind?
    # Three cards of the same rank. 
    scores.any? do |score|
      scores.count(score) == 3
    end
  end

  def two_pair?
    # Two different pairs.
    (scores.select { |score| scores.count(score) == 2 }.size) == 4
  end

  def pair?
    # Two cards of the same rank. 
    scores.any? do |score|
      scores.count(score) == 2
    end
  end

  def sort_scores
    cards.map(&:score).sort
  end

  def same_suit
    cards.map(&:suit).uniq.size == 1
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

# Output:

# 5 of Clubs
# 7 of Diamonds
# Ace of Hearts
# 7 of Clubs
# 5 of Spades
# Two pair
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true

# The exact cards and the type of hand will vary with each run.

# Most variants of Poker allow both Ace-high (A, K, Q, J, 10) 
# and Ace-low (A, 2, 3, 4, 5) straights. 
# For simplicity, your code only needs to recognize Ace-high straights.

# If you are unfamiliar with Poker, please see this description of the various hand types. 
# Since we won't actually be playing a game of Poker, it isn't necessary to know how to play.