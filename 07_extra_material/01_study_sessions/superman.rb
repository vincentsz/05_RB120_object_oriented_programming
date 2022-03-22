module Flightable
  def fly
    puts "I am #{@name}, I am a #{self.class}, and I can fly!"
  end
end

class Superhero 
  include Flightable
  
  attr_accessor :ability
  
  def self.fight_crime
    temp = self.new('')
    temp.ability = Ability.new('coding skills').description
    puts "I am #{self}"
    puts temp.announce_ability
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

