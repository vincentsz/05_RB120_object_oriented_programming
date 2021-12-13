# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new("red", "leather")
# The initialize method is expecting to arguments, so in order to create a new instance we have to call the new method on the Bag class and pass in two arguments.
#Otherwise an ArgumentError will be raised.