# How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

# Method access control are tools that help us manage encapsulation in Ruby, since in Ruby encapsulation is achieved by creating objects and exposing
# behaviors(or methods) to them. By default, all methods defined in a class are considered public, unless indicated otherwise. 
# An exeption to this is the initialize method, which is a private method. 
# In Ruby, the access modifiers are the following method calls: `public`, `private` and `protected`.
# A public method is accessible everywhere; inside and outside of the class. 
# A private method is only accessible to the original calling object within the class.
# Since Ruby 2.7 it can be called on an explicit `self` inside of the class, but not on any other object, even of the same type.
# A protected method functions as a private method outside of the class and as a public from within the class.
# This means that inside of the class they can be called on objects other than the calling object, while outside of the class they remain inaccessible.
# This is helpful when we want to compare values between objects, while maintaining a certain degree of control from outside of the class.
class Animal
  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def make_sound
    bark
  end
end

class Dog < Animal
  include Comparable

  def <=>(other)
    weight <=> other.weight
  end

  protected
  attr_reader :weight
  private

  def bark
    puts "#{@name} barks loudest!"
  end
end

toby = Dog.new('Toby', 10)
max = Dog.new('Max', 5)

[toby,max].max.make_sound

