#------Description-------

# Tic tac toe is a 2 player board game, played on a 3x3 grid. 
# Players take turns marking a square.
# The first player marking three squares in a row wins.

#------Verbs & nouns-------
# Nouns: 
#   -player
#   -board
#   -grid
#   -square
#   -row?
# Verbs:
#   -mark
#   -play

#------Organized-------
# -player
#   -play
#   -mark
# -board
# -square

#------Spike-------
class Board
  def initialize
    #how to model the 3x3 grid? squares?
    #what data structure
    # -array/hash of string/integers
    # -array/hash of Squares objects
  end
end

class Square
  def initialize
    #how to keep track if each squares mark? state?
  end
end

class Player
  def initialize
    #-maybe amarkers to keep track of this players symbol(X or O)
  end

  def mark

  end
end
