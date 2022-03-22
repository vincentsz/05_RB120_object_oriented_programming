class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name 
p sir_gallant.speak 


# What is output and returned, and why? What would we need to change so that the last line outputs `”Sir Gallant is speaking.”`? 

# "Sir Gallant" and "Gallant is speaking." is output and returned. 

# On line 19 a new Knight object, sir_gallant is instantiated with a "Gallant" string argument.
# In the constructor the @name ivar is assigned to this string.

# On line 20 p is called on the return value of sir_gallant.name.
# Ruby will go up the method lookup chain and find a name method in the Knight class, here it will concatenate "Sir" with the return value of the super call.
# super goes up the method lookup chain looking for a similarly named method. It finds the name getter method in the Character class, 
# which will return our @name ivar, resulting in "Sir Gallant" being output.

# On line 21 p is called on the return value of sir_gallant.speak call.
# Ruby will go up the method lookup chain and find a speak method in the Character class, 
# there a string representation of the @name ivar will be returned through string interpolation
# and will be concatenated with "is speaking" resulting in "Gallant is speaking.""

# If we want our return to be "”Sir Gallant is speaking.”, we should simply call the name getter method instead of the @name ivar inside of the speak method. 
# since this will follow the same logic as the sir_gallant.name call as decribed above.