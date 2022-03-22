# How and why would we implement a fake operator in a custom class? Give an example.

# Fake operators are methods that look like operators because of Ruby's syntactical sugar.
# Since they are methods, we can implement them in our classes and take advantage of the special syntax for our own objects.
# These methods are usually predefined for most classes in the Ruby core library.
# Therefore, when we define them in a custom class we can push the functionality to one of these standard classes.
# When defining fake operators in a custom class we should always follow the logic that already exists in the existing method definitions, 
# meaning they should perfom similar actions and return similar objects than the original method.
# For instance,the `Array#+` method concatenates two `Array` objects and returns an `Array` object, 
# so a custom `+` method should concatenate two custom objects and return a custom object.


# An example would be a custom `==` class that compares two states of two custom objects

class Animals
  attr_reader :feet

  def initialize(feet)
    @feet = feet
  end

  def ==(other)
    feet == other.feet
  end
end

class Cow < Animals
end

class Chicken < Animals
end

bella = Cow.new(4)
mary  = Chicken.new(2)

p bella == mary