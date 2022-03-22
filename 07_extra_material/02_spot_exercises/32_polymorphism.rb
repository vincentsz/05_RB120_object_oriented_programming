# What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

# Polymorphism is the ability for different types of data to respond to a common interface.
# In Ruby, objects of different types will report to the same method invocation.
# This is achieved through inheritance (class inheritance & interface inheritance) or duck-typing.
# If methods are not intentionally designed to be polymorphic, you don't have polymorphism.

# Polymorphism through inheritance means that you either inherit behavior from a super class or module
# or that you override behavior from a superclass or module.
# The interface (client code) lets us work with all types in the same way, even though it's implementation may be different.

class Animal
 def make_sound
  puts "Hi!"
 end
end

class Dog < Animal
  def make_sound
    bark
  end

  def bark
    puts "Woof"
  end
end

class Cat < Animal
end

toby = Dog.new
timmy = Cat.new
[toby, timmy].each(&:make_sound)

# Polymorphism through duck typing is a form of polymorphism where we don't care about the type of the object, only if it can implement a certain behavior. 
# Objects of unrelated types will respond to a similar method name.
# It's an informal way to ascribe a certain type to an object, without using inheritance.
# It's essentially a way to avoid having many dependencies between classes, its methods and the arguments they take.
# Why 'duck' typing?: If it has the behavior of a duck (ex: quacking(= its public interface allows for quacking)), we can treat it as a duck, 
# regardless if it really is (we don't care about its type).

class Dog
  def make_sound
    bark
  end

  def bark
    puts "Woof"
  end
end

class Cat
  def make_sound
    meow
  end

  def meow
    puts "Meow!"
  end
end

toby = Dog.new
timmy = Cat.new
[toby, timmy].each(&:make_sound)
