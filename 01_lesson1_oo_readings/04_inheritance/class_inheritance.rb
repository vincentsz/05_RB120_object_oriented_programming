class Animal
  def speak
   'Hey!'
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def speak
    "#{self.name} says arf"
  end

end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
meow = Cat.new
sparky.speak
meow.speak