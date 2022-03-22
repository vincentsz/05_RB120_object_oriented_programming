# What is the `attr_accessor` method, 
# and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class? Give an example.

# the attr_accessor method combines both the attr_reader and attr_writer methods(the accessor methods) which in turn create the getter and setter methods for our instance variables.
# Creating these methods in the public interface means that we are exposing and making our ivars accesible for reassignment, 
# which is something you do not always want to do. 
# We'd only want to expose data when absolutely necesary, this is one of the basics of encapsulation, an integral component of OOP.

# Consider the following example:

class Person
  attr_accessor :ssn

  def initialize(ssn)
    @ssn = ssn
  end
end

bob = Person.new('1234_5678_90')
p bob.ssn
bob.ssn = '0987_6543_21'
p bob.ssn

# Our @ssn ivar is exposed outside of our class and can be reassigned as well, which is behavior we'd normally woudln't want.


