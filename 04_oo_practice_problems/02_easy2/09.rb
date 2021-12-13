# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, 
# keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# when we would call the instance method play on an instance of Bingo, 
#   the play method definded in the Bingo class would be executed. 
#   This is because Bingo inherits from Game, meaning thet Bingo comes earlier in the method lookup chain than Game, 
#   so play methodf in Bingo will be found first, as soon as e method is found ruby executes this and stops looking for it.