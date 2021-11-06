module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle

  attr_accessor :year, :model, :color

  @@num_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@num_of_vehicles += 1
  end

  def self.num_of_vehicles
    @@num_of_vehicles
  end


  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(gallons, mileage)
    puts "#{mileage / gallons} gallons per mile."
  end

  def display_age
    p "Your #{self.model} is #{calculate_age} years old."
  end

  private

  def calculate_age
    current_year = Time.new.year
    current_year - year.to_i
  end 

end

class MyCar < Vehicle
  NUMBER_OF_WHEELS = 4

  def to_s
    "My car is a #{year} #{color} #{model}."
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_WHEELS = 6

  def to_s
    "My truck is a #{year} #{color} #{model}."
  end
end

my_car = MyCar.new(2000, "Ford", "White")
my_truck = MyTruck.new(1999, "GMC", "Black")
my_car2 = MyCar.new(2008, "Tesla", "Grey")
my_truck2 = MyTruck.new(1999, "Volvo", "Yellow")

my_car.display_age
