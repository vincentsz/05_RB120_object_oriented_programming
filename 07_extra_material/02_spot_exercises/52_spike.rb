=begin

Design a Sports Team (Author Unknown...thank you!)

- Include 4 players (attacker, midfielder, defender, goalkeeper)
- All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
- All players can run and shoot the ball.
- Attacker should be able to lob the ball
- Midfielder should be able to pass the ball
- Defender should be able to block the ball
- The referee has a whistle. He wears black and is able to run and whistle.

1. extract major nouns and verbs
  nouns:
    - team
    - player
    - attacker
    - midfielder
    - defender
    - goalkeeper
    - jersey_color
    - blue
    - white with blue stripes
    - black
    - ball
    - referee
    - whistle
  verbs:
    - run
    - shoot
    - lob
    - pass
    - block
    - whistle

    2. organize verbs and nouns
    - team
    - player
        - run
        - shoot
    - attacker
        - lob
    - midfielder
        - pass
    - defender
        - block
    - goalkeeper
    - jersey_color
    - blue
    - white with blue stripes
    - black
    - ball
    - referee
      - whistle
    - whistle
 
=end
module Runnable
  def run
  end
end


class Team
  def initialize
    @players = [Attacker.new, Midfielder.new, Defender.new, Goalkeeper.new('white and blue stripes')]
  end
end

class Player
  include Runnable

  def initialize(color = 'blue')
    @jersey_color = color
  end

  def shoot_ball
  end
end

class Attacker < Player
  def lob_ball
  end
end

class Midfielder < Player
  def pass_ball
  end
end

class Defender < Player
  def block_ball
  end
end

class Goalkeeper < Player
end

class Referee
  include Runnable
  
  def initialize
    @jersey_color = "black"
    @whistle = true
  end

  def whistle
  end
end
