class Animal
  def initialize(n)
    @name = n
  end
end

class Dog < Animal
  def initialize(n); end

  def speak
    "bark! bark! #{@name}! bark! bark!"
  end
end

teddy = Dog.new('Teddy')
puts teddy.speak
