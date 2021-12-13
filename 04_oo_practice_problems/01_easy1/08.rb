# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does self refer to here?
#make-one_year older is an instance method and can only be called on instances of the Cat class 
#self refers to the the instance (or object) that called the method; the calling object