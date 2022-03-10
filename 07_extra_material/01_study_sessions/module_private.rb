module Walkable
  def walk
    p self.class.ancestors
    p "#{name} #{gait} forward"
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

mike = Person.new("Mike")
mike.walk


# What is returned/output in the code? 

#Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?