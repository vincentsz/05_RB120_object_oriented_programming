# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    #return 
    "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

light = Light.new("super high", "green")
light.brightness
light.color

light.brightness = "low"
light.color = "red"
light.brightness
light.color


# The return is obsolete, in any method last line will be returned (if an explicit return is absent)
# the getter and setter methods can be used to access and alter brightness and color outside of the class