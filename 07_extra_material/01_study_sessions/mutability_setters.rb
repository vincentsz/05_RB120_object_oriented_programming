class Actor
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(new_name) # custom setter method 
    @name = new_name.upcase!
  end
end

brad = Actor.new('Brad Pitt') # instantiate a new `Actor` object
result = (brad.name = 'Leonardo di Caprio') # setter method 

puts result 
puts brad.name 
