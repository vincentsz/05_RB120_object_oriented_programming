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

# In the name of the cats_count method we have used self. What does self refer to in this context?
# The cats_count method is a class method, class methods can only be called directly on the class itself. 
# self here preced the cats_count method name, which is how we define class methods, 
# here self refers the class itself, which in this case is Cat.