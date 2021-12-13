# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Cat.cats_count
meow = Cat.new("Tabby")
Cat.cats_count

grr = Cat.new("Tiger")
Cat.cats_count

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?
#@@cats_count keeps track of how many new Cat objects are instantiated, It is initialized and set to 0 on line 4. 
# inside the instance method initialize, on line 9, i set to itself plus one.
# Qe know that initialize is called every time a new Cat object is instantiated, so one will be added to @@cat at this moment
# The self.cats_count returns the class vatiable @@cats_count 