class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end

# What are the scopes of each of the different variables in the above code?

# Constants are first looked for through lexical scope then inheritance and then top level.
# Here the scope of TITLES is at the class level.
# We can use a constant resolution operator to reach into the class for the constant, making constants accessible to unconnected classes.
# Class variables are scoped a the class level, so @@total_people's scope is the Person class.
# Instance variables are scoped at the object level, so it's scope would be limited to any Person object being instantiated.
# @age is not initialized, ruby will return nil by default for unitialized ivars, 
# since the ivar needs to be initialized before it can be part of an objects state it wouldn't have a scope just yet, since it does not yet exist.