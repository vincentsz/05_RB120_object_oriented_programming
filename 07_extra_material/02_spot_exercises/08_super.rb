class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")        


# What is output and why? What does this demonstrate about `super`? 

# This will raise an Argument error. 
# super without parentheses passes all arguments passed into the method up the method lookup chain. 
# So here it is passing one argument, our 'black' String object to the Animal#initilize method.
# This method however is defined to take no arguments, resulting in the error.
# Adding empty parenheses as such ; super() will resolve the problem, 
# since this tells Ruby explicitly to not send along any arguments when going up the method lookup chain.