# What is encapsulation, and why is it important in Ruby? Give an example.

# Encapsulation is the act of making functionalities unavailable to the rest of the code base.
# Ruby does this by creating objects and exposing interfaces (methods) to interact with those objects.
# Both behaviors(methods) and states(instance variables) are encapsulated in an object,
# only methods however can be (directly) exposed to the outside world. 
# The methods that allow access to the object are called the public interface of a class.
# These methods are defined in the class and all objects of the class have access to them. 
# Access modifiers are tools for hiding or exposing the behavior encapsulated in an object.
# Encapsulation allows us to create a layer of abstraction, by representing the objects as real-world nouns and behaviors (or methods) as real-word verbs.


class Dog
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_sound
    bark
  end

  private
  def bark
    'Woof!'
  end
end

max = Dog.new('Max')

p max.name
p max.make_sound