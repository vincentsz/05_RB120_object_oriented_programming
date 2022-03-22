class Human
  attr_writer :name

  def greeting
    puts "Hello #{@name}"
  end
end

human = Human.new
human.name = "Sam"
p human.greeting


# What does the last line ouput and why?
# An instance variable is created through attr_accessor. Unlike a local variable, 
# an instance variable does not require an assigned value (the default return value of an instance variable is nil).