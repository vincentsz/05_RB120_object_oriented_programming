class Vehicle
  WHEELS = 4

  def wheels
    self.class::WHEELS
  end
end

class Motorcycle < Vehicle
  WHEELS = 2
end

mercedes = Vehicle.new
mercedes.wheels # => 4

toyota = Motorcycle.new
toyota.wheels
