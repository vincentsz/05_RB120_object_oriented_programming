# Modify the following code to accept a string containing a first and last name. 
# The name should be split into two instance variables in the setter method, then joined in the getter method to form a full name.

class Person
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def initialize_from_class(n)
    initialize(n)
  end
end

person1 = Person.new("Tom")
person1.initialize_from_class("Fred")
puts person1.name


# class Person
#   attr_reader :name
a
#   def initialize(n)
#     @name = n
#   end
# end

# person1 = Person.new("Tom")
# person1.initialize('Fred')
# person1.name

# class Person
#   attr_reader :name

#   def initialize(n)
#     @name = n
#   end

#   public :initialize
# end

# person1 = Person.new("Tom")
# person1.initialize('Fred')
# puts person1.name


# class Person
#   attr_reader :name

#   def initialize(n)
#     @name = n
#   end
# end

# person1 = Person.new("Tom")
# person1.initialize('Fred') #=> private method `initialize' called for #<Person:0x00007feaf4943090 @name="Tom"> (NoMethodError)
# puts person1.name

