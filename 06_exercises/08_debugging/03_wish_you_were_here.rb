class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude, :coordinates

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end



  def ==(other)
    coordinates == other.coordinates
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  protected

  def coordinates
    [latitude, longitude]
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

# On lines 37 and 38 of our code, we can see that grace and ada are located at the same coordinates.
# So why does line 39 output false? Fix the code to produce the expected output.

#textbook
class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end
end

# Line 39 outputs false because ada.location == grace.location is comparing two Geolocation objects. 
# Since there is no == method defined in the Geolocation class, Ruby will use the BasicObject#== method to compare objects. 
# This method compares the corresponding object ids, basically asking if the two compared objects are one and the same.
# We can define a custom == method in the Geolocation class, that overrides BasiObject#== (through method lookup path),
# that compares the respective @latitude and @longitude ivars.
# Within this custom == method, Array#==gets called which in turn calls Float#==on the ivars since they are both Float objects.
