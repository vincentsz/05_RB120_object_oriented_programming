# Ben and Alyssa are working on a vehicle management system. 
# So far, they have created classes called Auto and Motorcycle to represent automobiles and motorcycles. 
# After having noticed common information and calculations they were performing for each type of vehicle, 
# they decided to break out the commonality into a separate class called WheeledVehicle. 
# This is what their code looks like so far:
module Fuelable
  attr_accessor :fuel_efficiency, :fuel_capacity

  def initialize(manufacturer, vehicle_properties, km_traveled_per_liter, liters_of_fuel_capacity)
    super(manufacturer, vehicle_properties)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Vehicle 
  attr_accessor :manufacturer

  def initialize(manufacturer)
    @manufacturer = manufacturer
  end
end

class HulledVehicle < Vehicle
  attr_accessor :speed, :heading, :num_propellers, :num_hulls

  def initialize(manufacturer, hulled_properties)
    super(manufacturer)
    @num_propellers, @num_hulls = hulled_properties
  end
end

class WheeledVehicle < Vehicle
  attr_accessor :speed, :heading, :tires

  def initialize(manufacturer, wheeled_properties)
    super(manufacturer)
    @tires = wheeled_properties
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  include Fuelable

  def initialize
    # 4 tires are various tire pressures
    super("BMW", [30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  include Fuelable

  def initialize
    # 2 tires are various tire pressures
    super("Toyota", [20,20], 80, 8.0)
  end
end

# Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

class Catamaran < HulledVehicle
  include Fuelable

  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(manufacturer, num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    hulled_properties = [num_propellers, num_hulls]
    super(manufacturer, hulled_properties, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class Bicycle < WheeledVehicle
  def initialize
    super("Cannondale", [20,20])
  end
end

class Kayak < HulledVehicle
  def initialize(manufacturer, num_propellers, num_hulls)
    hulled_properties = [num_propellers, num_hulls]
    super(manufacturer, hulled_properties)
  end
end
 
my_motorcycle = Motorcycle.new
p my_motorcycle.manufacturer
p my_motorcycle.tires = [35, 35]
p my_motorcycle.tires

my_car = Auto.new
p my_car.range
p my_car.fuel_capacity = 40
p my_car.range


my_catamaran = Catamaran.new("Etap", 2, 2, 200, 16.0)
p my_catamaran.manufacturer = "Seawind"
p my_catamaran.fuel_capacity

my_bicycle = Bicycle.new
p my_bicycle.tire_pressure(0)
p my_bicycle.inflate_tire(0, 30)
p my_bicycle.tire_pressure(0)

my_kayak = Kayak.new("Atlantis", 0, 1)
p my_kayak.num_hulls


# This new class does not fit well with the object hierarchy defined so far. 
# Catamarans don't have tires. But we still want common code to track fuel efficiency and range. 
# Modify the class definitions and move code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.

