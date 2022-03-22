class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end


# What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?

# `Triangle.sides` can return both nil, 3 and 4, depending on when exactly each object is instantiated. 
# Class variables are scoped at the class level and inherited, meaning there's always just one class variable @@sides shared between our related classes.
# This in turn means that any subclass can change the value of the class variable, making it dangerous to work with class variables in an inheritance context.
# So class variables should't be used when working with inheritance.
Shape.new
p Triangle.sides #=> nil
Quadrilateral.new
p Triangle.sides # => 4
Triangle.new
p Triangle.sides # => 3

# `Triangle.new.sides` can only return 3, since we are calling the sides instance method right after instantiating the Triangle object, 
# meaning that the other objects do not have the chance to override the @@ssides class variable