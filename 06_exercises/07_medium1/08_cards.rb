class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze
  SUITS = ['Diamonds', 'Clubs', 'Hearts', 'Spades'].freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    result = VALUES.index(rank) <=> VALUES.index(other.rank)
    # if result == 0
    #   return SUITS.index(suit) <=> SUITS.index(other.suit) 
    # end
    result
  end
end

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min == Card.new(8, 'Diamonds')
puts cards.max == Card.new(8, 'Spades')