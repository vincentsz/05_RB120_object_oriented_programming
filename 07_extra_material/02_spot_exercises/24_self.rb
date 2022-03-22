# What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.

# `self` is a way of being explicit about what our program is referencing.
# `self` changes depending on the scope it is used in:

# Inside of a class:
# Inside instance methods, `self` references the calling object.
# Outside of an instance method, `self` references the class itself.

# Inside Mixin Modules:
# Outside of an instance method `self` will refer to the module.
# Inside of an instance method `self` will refer to the calling object.

# Outside any class or module:
# Outside any class `self` refers to the `main` object.

# `self` is used when defining a class method; a method definition prefixed with `self` is the same as defining the method on the class itself.
# This is how we define class methods.

# `self` is also used when calling setter methods. 
# To disambiguate from a local variable assignment, Ruby requires us to prepend `self` to a setter call.

class Building
  def self.what_am_i
    puts "I am a #{self} class."
  end
end

class Architect
  attr_accessor :employees

  def initialize
    @employees = 0
  end

  def change_employees(num)
    self.employees = num
  end
end

bob = Architect.new
p bob.employees
bob.change_employees(2)
p bob.employees
