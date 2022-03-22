# How do class inheritance and mixing in modules affect instance variable scope? Give an example.

# Instance variables keep track of states, states track attributes for individual objects.
# They are scoped at the instance (or object) level.
# Instance variables are unique to each object, so unlike instance methods, they are not inherited.
# Howerever, objects can inherit the methods (through class inheritance or interface inheritance) 
# that can set or alter instance variables, the variables themselves though are still scoped at the object level.
# If these methods are not called, the ivar is not initialized, and Ruby will return `nill` by default
# (unlike an unitilialized local variable, which would return a NameError).

class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize; end

  def show_name
    puts "Hi, my name is #{@name}."
  end
end

toby = Dog.new
toby.show_name
p toby