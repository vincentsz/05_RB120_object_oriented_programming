class Person
  attr_accessor :name, :pets

  def initialize(n)
    @name = n
    @pets = []
  end
end

class Cat; end

class Dog; end

joe = Person.new("Joe")
kitty = Cat.new
sparks = Dog.new

joe.pets << kitty
joe.pets << sparks

puts joe.pets