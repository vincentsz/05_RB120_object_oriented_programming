class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name   


# What is output and why?

# "bark! bark!  bark! bark!" is output since the @name ivar in the dog_name method is referring nil, 
# this because the @name ivar was never initialized, and unitialized ivars refernce nil by default.
# It's uninitialized because the Dog class has it's own (empty) initialize method and so it won't inherit the initialize method from Animal
# Since the initialization would only happen in the Animal class, @ivar will reference nil.
