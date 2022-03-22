module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

p Penguin.ancestors

pingu = Penguin.new
# pingu.fly

# What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.
# [Penguin, Migratory, Aquatic, Bird, Animal, Object, Kernel, BasicObject]. We can verify this by calling ::ancestors on the Penguin class.