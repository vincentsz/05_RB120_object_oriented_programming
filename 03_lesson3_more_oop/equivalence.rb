class Person
  attr_accessor :name

  def ==(other)
    name == other.name # => String#==
  end

end

bob1 = Person.new
bob1.name = "Bob"

bob2 = Person.new
bob2.name = "Bob"

bob1 == bob2