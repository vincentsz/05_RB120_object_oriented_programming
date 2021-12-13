class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

kim = Person.new("Kim", 23)
tom = Person.new("Tom", 31)

puts "Tom is older than Kim." if tom > kim
