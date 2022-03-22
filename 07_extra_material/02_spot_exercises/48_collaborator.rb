class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)


# What are the collaborator objects in the above code snippet, and what makes them collaborator objects?

# Collaborator objects are any object saved in another objects state.
# Here, the String object "Sara", initialized to the @name ivar inside the Person class, The String object "Fluffy", 
# initialized to the @name ivar in the Cat class and the Person object sara, initialized to the @owner ivar in the Cat class are all collaborator objects.