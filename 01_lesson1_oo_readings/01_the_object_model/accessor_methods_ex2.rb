class MyCar

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
end

first_car = MyCar.new('1998', 'blue', 'Toyota')
first_car.speed_up(20)
first_car.current_speed
first_car.brake(10)
first_car.current_speed
first_car.shut_off
first_car.current_speed