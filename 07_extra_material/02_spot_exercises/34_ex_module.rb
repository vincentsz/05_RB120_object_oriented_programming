module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters" 
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk


# What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?

# Modules (or interface inheritance) are used when we want to inherit behavior that does not fit a strict hierarchical structure.
# Since not all, but some, animals can walk we do not want it to be defined in a superclass from which all subclasses would inherit (ex.: an Animal class). 
# At the same time, we wouldn't want to define a `walk` method in every class that needs it, since we dont want to repeat ourselves (DRY). 
# In this instance we can use a Module. We define it only once and mix it in where necesary. 
# 
  