class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  def self.wheels
    WHEELS
  end

  def wheels
    WHEELS
  end
end

Car.wheels
toyota = Car.new

toyota.wheels
