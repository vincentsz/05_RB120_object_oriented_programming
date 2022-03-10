class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

bob.pets.jump


# We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object? 

# The @pets ivar is assigned to an empty array on line 6. 
# On line 25 and 26 the respective Cat and Bulldog objects are appended to the array. 
# When calling the setter method pets (defined by attr_accessor) on our bob object, an Array object is returned. 
# When we then call jump, an error is raised since the Array class has no jump method defined.
# What we want to do is call jump on the objects within that array,
#  since both Cat and Bulldog objects inside this array inherit the jump method that is defined in the Pet parent class. 
# So we could do the following to fix the code:
  bob.pets.each do { |pet| pet.jump }
# kitty and bud are collaborator objects of the Person object. A collaborator object is an object saved in the state of another object.
# These represent the connections between various actors in your program.