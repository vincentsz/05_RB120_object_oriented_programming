class Cat

  def initialize(name)
    @name = name
    greet
  end 

  def greet
    puts "Hello my name is #{@name}!"
  end

end

kitty = Cat.new('Sophie')
kitty.greet