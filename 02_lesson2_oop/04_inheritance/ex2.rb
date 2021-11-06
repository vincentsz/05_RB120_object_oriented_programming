# Given this class:
class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

sparky = Dog.new
puts sparky.speak
puts sparky.fetch
minou = Cat.new
puts minou.speak
puts minou.fetch
# Create a new class called Cat, which can do everything a dog can, except swim or fetch. 
# Assume the methods do the exact same thing. 
# Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.