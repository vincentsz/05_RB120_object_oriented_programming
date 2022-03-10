module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end
p Describable.ancestors
p Square.sides 
p Square.new.sides 
p Square.new.describe_shape 


# What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?
# Line 25: 4
# line 26: 4
# line 27: NameError is raised

# This demonstrates that in Ruby a constant will first be looked for through its lexical scope, meaning that Ruby will look for the constant there where it is referenced. 
# secondly ruby will look up the method lookup chain for the constant, to lastly check for the constant in the top level.

# On line 25 the class method sides is called on the class Square. Within the class method sides self refers to the class itself, which in this case owuld be Square::Sides.
# Ruby looks there, won't find so will move up the method lookup chain. Since Square inherits from Quadrilateral and the constant is defined there, it will return 4

# On line 26 the instance method sides is called on a Square object, Through inheritance, sides is found in the Shape class.  There self will refer to the calling object. 
# The calling object is a Square object so callin self on it will return Square which means that self.class::SIDES is equivalent to Square::SIDES.
# Again, Ruby looks there, won't find so will move up the method lookup chain. Since Square inherits from Quadrilateral and the constant is defined there, it will return 4

# On line 27 we call desciribe_shape on a square obj. describe_shape is an intance method defined in the Describable module. 
# It is accesible to square beacuse square inherits from quad which inherits from shape, which has included the Desc module.
# Within this module Ruby will look for the SIDES constant, since it is refernced ther without any constant resolution operator. 

