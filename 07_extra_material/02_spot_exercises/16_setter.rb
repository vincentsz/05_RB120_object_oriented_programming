# Why is it generally safer to invoke a setter method (if available) 
# vs. referencing the instance variable directly when trying to set an instance variable within the class? 
# Give an example.

# It is generally safer to use a setter method, since we can implement code that will protect our ivar from some undesirable reassignment. 
# If we use the ivar directly, this validation would be bypassed. For instance if we want our ivare only to be reassigned to a string we could implement it as following:

# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def name=(name)
#     @name = name if name.is_a? String
#   end

#   def change_name(n)
#     self.name = n
#   end
# end

# bob = Person.new("Bob")
# p bob.name
# bob.change_name(808)
# p bob.name
# bob.change_name('Bobby')
# p bob.name

# # Now if we were to change the change_name method to reference the @name ivar directly, the validation that is happening in the setter method would be bypassed:

# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def name=(name)
#     @name = name if name.is_a? String
#   end

#   def change_name(n)
#     @name = n
#   end
# end

# bob = Person.new("Bob")
# p bob.name
# bob.change_name(808)
# p bob.name
# bob.change_name('Bobby')
# p bob.name

# Even better practice would be to make the setter method private, since we want to limit any unnecesary exposure of methods:

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def change_name(n)
    self.name = n
  end

  private

  def name=(name)
    @name = name if name.is_a? String
  end
end

bob = Person.new("Bob")
p bob.name
bob.change_name(808)
p bob.name
bob.change_name('Bobby')
p bob.name
bob.name = "Tom"

