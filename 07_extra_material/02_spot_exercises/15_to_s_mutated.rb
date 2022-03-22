class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
Kernel.puts(bob)
puts bob.name


# What is output on `lines 14, 15, and 16` and why?


# On line 14 the name getter method, that is defined on line 2 by an attr_reader method, is called on the bob object.
# 'Bob' is output, since 'Bob' is assigned to the @name ivar on line 5, by instantiating the bob object on line 13.

# On line 15 we call puts on the bob object. By default, puts always calls a to_s method on its argument.
# Since a to_s method is defined in the Person class, and Person is the first class it encounters in the method lookup chain this to_s ethod will be used by puts.
# Within the to_s method we are mutating the @name ivar, by the upcase! method call on the name getter method. 
# This method call returns the original (mutated) argument resulting in:
# "My name is BOB."
# On line 16 we are agian calling the name getter method on the bob object, this will return the @name ivar, which is now referencing the mutated string. 
# So when we call puts on this string object, BOB is returned.