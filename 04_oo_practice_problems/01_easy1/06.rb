#What could we add to the class below to access the instance variable @volume?

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

big_cube = Cube.new(5000)
big_cube.volume

#textbook1

class Cube
  def initialize(volume)
    @volume = volume
  end
end

big_cube = Cube.new(5000)
big_cube.instance_variable_get("@volume")

#textbook2

class Cube
  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

big_cube = Cube.new(5000)
big_cube.get_volume
