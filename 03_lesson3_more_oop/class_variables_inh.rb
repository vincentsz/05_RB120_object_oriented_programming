class Vehicles
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

class Motorcycles < Vehicles
  @@wheels = 2
end

Vehicles.wheels
Motorcycles.wheels