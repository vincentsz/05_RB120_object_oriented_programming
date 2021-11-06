# Now that we have a Walkable module, we are given a new challenge.
# Apparently some of our users are nobility, and the regular way of walking simply isn't good enough.
# Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:
module Walkable
  def to_s
    name
  end

  def walk
    "#{self} #{gait} forward"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :name, :title

  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  private

  def to_s
    title + ' ' + name
  end

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other purposes that we aren't showing here.

p byron.name
# => "Byron"
p byron.title
# => "Lord"

# The easiest way to accomplish this is to provide a method that returns both the title and name objects of the Noble class, 
# and just the name for other classes.
# solution Sean
# class Noble
#   include Walkable

#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   def walk
#     title + " " + super
#   end

#   private

#   def gait
#     "struts"
#   end

# end