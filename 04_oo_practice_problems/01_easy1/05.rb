class Fruit
  attr_accessor :name

  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

orange = Fruit.new("Orange")
orange.instance_variables
hawaian = Pizza.new ("Hawaian")
hawaian.instance_variables


# instance variable start with @, so the Pizza class has @name instance variable which is initialized in the initilize method. 
# the Fruit class does not since name is not preceded with@ in the initialize method.