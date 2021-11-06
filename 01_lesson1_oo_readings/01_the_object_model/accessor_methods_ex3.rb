=begin
You want to create a nice interface that allows you to accurately describe the action you want your program to perform.
Create a method called spray_paint that can be called on an object and will modify the color of the car.


=end

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(num)
    @speed += num
    puts "You push the gas and accelerate #{num} km per hour."
  end

  def brake(num)
    @speed -= num
    puts "You push the brake and slow down #{num} km per hour."
  end

  def shut_off
    @speed = 0
    puts "You shut off the car!"
  end

  def current_speed
    puts "You are now driving #{@speed}!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new color is #{color}, looks great!"
  end

end

first_car = MyCar.new('1998', 'blue', 'Toyota')
puts first_car.color
first_car.spray_paint("green")
puts first_car.color
