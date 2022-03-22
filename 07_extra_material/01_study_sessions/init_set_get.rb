# Write the appropriate class and methods to get the expected output.

class Person
  # attr_accessor :name
  attr_reader :age

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "My name is #{name}, and I belong to the #{self.class} class."
  end
end

jim = Person.new('Jim', 23)

puts jim.name      # 'Jim'
puts jim.age       # 23

jim.name = 'James'
puts jim.name    # 'James'

puts jim      # 'My name is James, and I belong to the Person class.'