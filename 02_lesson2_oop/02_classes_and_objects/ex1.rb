# Given the below usage of the Person class, code the class definition.

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name

class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'robert'  

# Textbook

class Person
  attr_accessor :name

  def initialize(n)
    @name = n
  end
end