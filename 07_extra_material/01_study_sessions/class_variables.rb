class Car
  WHEELS = 4

  def wheels
    WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
  
  def wheels
    super + self.class::WHEELS
  end
end

civic = Car.new
puts civic.wheels

bullet = Motorcycle.new
puts bullet.wheels