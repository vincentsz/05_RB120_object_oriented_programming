module Flightable
  def fly
    # IMPLEMENTATION
  end
end

class Superhero 
  include Flightable
  
  attr_accessor :ability
  
  def self.fight_crime
    # IMPLEMENTATION
  end
  
  def initialize(name)
    @name = name
  end
  
  def announce_ability
    puts "I fight crime with my #{ability} ability!"
  end
end

class LSMan < Superhero ; end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')
superman.fly # => I am Superman, I am a Superhero, and I can fly!
LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!

a = 'string'
b = [1,2,3]
c = { }

[a,b,c].each{|item| puts item.empty?} 


module Flightable
  def fly
    puts "I am #{@name}, I am a #{self.class.name}, and I can fly!"
  end
end

class Superhero 
  include Flightable
  
  attr_accessor :ability
  
  def self.fight_crime
    throwaway_obj = self.new("") # we aren't using this
    throwaway_obj.ability = Ability.new("coding skills").description # do we even need this rather than just setting the string directly
    puts "I am #{self.name}!"
    throwaway_obj.announce_ability
  end
  
  def initialize(name)
    @name = name
  end
  
  def announce_ability
    puts "I fight crime with my #{ability} ability!"
  end
end

class LSMan < Superhero ; end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')
superman.fly # => I am Superman, I am a Superhero, and I can fly!
LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!


