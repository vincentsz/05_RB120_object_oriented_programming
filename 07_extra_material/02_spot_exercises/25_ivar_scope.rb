class Person
  def initialize(n)
    @name = n
  end
  
  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"


 # What does the above code demonstrate about how instance variables are scoped?


# Instance variables are scoped at the object level, meaning that they are unique for eech object and not shared bewteen objects.
# The get_name method call on the person object bob returns "bob" since that is what it is initialized to on line 3 when the object was instantiated on line 11. 
# The instantiation of joe on line 12 does not change the assignement of the ivar, since it is unique for each object.