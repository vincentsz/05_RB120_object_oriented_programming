class Mammal 
  def walk
     "#{name} #{gait} forward"
  end
end

class Person < Mammal 
 
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private
  def gait
    "strolls"
  end
end

mike = Person.new("Mike")
mike.walk