=begin
- Twenty one is a game played by two players, a player and a computer. Participants try to get as close to 21 without going over.
- Each player is dealt two cards out of a deck of 52.
- Player starts, can decide to hit or stay
- If he stays, it's computers turn
- If player goes over 21 he goes bust
- Computer needs to hit until he reaches minimum 17.
- If computer goes over 21 he goes bust.
- If both players did not go bust, highest score wins
- If score is equal it's a tie


Nouns: player, computer, cards, deck, score, game
Verbs: deal, hit, stay, bust, 

Participant
- hits
- stays
- calculate_total
- busted?

Player < Participant


Computer < Participant


Deck 
-deal

Card

Game
-start
=end
class Participant
  def hit

  end

  def stay

  end

  def busted?

  end

  def calculate_total

  end
end

class Player < Participant
  def initialize

  end
end

class Computer < Participant
  def initialize

  end
end

class Deck
  def initialize

  end

  def deal

  end
end

class Card
  def initialize

  end
end

class Game
  def play
    deal_cards
    show_initial_cards
    player_turn
    computer_turn
    show_final result
  end
end

Game.new.play



