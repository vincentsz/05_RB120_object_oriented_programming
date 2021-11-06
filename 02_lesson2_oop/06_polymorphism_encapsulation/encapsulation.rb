class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_name(n)
    self.nickname = n
  end

  def greeting
    "#{nickname} says woof!"
  end

  private 
  attr_writer :nickname
end

dog = Dog.new("barry")
dog.change_name("love")
puts dog.greeting