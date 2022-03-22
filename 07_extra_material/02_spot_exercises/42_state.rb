class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")


# Do `molly` and `max` have the same states and behaviors in the code above? Explain why or why not, and what this demonstrates about objects in Ruby.

# max and molly Cat objects have the same behaviors, while their states are unique. The behaviors or (public)instance methods of a class 
# are the public interface of a class, meaning that they are accesible to all objects of that class. 
# State, or instance variables, are scoped at the object level, and are unique for each object.
# This demonstrates that objects of the same class share the behaviors defined in that class, while their states are unique to the object.