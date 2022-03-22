class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky


# What is output and why? How could we output a message of our choice instead?

# <GoodDog:object_id_rep> 
#puts calls to_s on the sparky object, since no to_s method is defined, the Object#to_s method will be called, 
# which by default returns a string representating of the class and object_id of the calling object.
# We'd need to define a custom to_s method in the calling objects class that returns a custom string.

# How is the output above different than the output of the code below, and why?

# <GoodDog:object_id_rep, @name = 'Sparky', @age = 28>
# p, by default, calls inspect on the object, 
# which returns a string representation of the class, the object_id of the calling object and its ivars.

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky

