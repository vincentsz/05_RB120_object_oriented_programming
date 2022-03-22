class FarmAnimal
  def speak
    "A #{self.class.to_s.downcase} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

p Sheep.new.speak
p Lamb.new.speak
p Cow.new.speak 


# What is output and why? 
# "#<Sheep:0x0000000102c45790> says baa!", "#<Lamb:0x0000000102c45100> says baa!baaaaaaa!"and "#<Cow:0x0000000102c44ac0> says mooooooo!" 
# is output on consecutive lines.
# on line 25, 26 and 27 p is called on the return of the speak method call on instantiated Sheep, Lamb and Cow objects, respectively.

# Sheep inherits from FarmAnimal. Therefore when speak is called on Sheep it will, through the method lookup chain, find a speak method in Sheep.
# There it will jump to the Farmanimal#speak method, since super is called. 
# Here string interpolation is called on self.
# self inside of a class, inside of an instance method is the orignal calling object.
# So a string representation of the object is retuned and will be concatenated with "says "
# ruby then continues execution of the original speak method, concatanting "baa" with the above string.
# P will then call inspect on the string which resuts in the output above.

# Lamb inherits from Sheep. Therefore when speak is called on Lamb it will, through themethod llokup chain, find a speak method in Lamb.
# There it will jump to the Sheep#speak method, since super is called. From ther it will jump to the above speak method in Farmanimal, 
# since another super method is called. Here string interpolation is called on self.
# self inside of a class, inside of an instance method is the orignal calling object.
# So a string representation of the object is returned and will be concatenated
# Resulting in string interpolation of the Lamb object being concatenated first with say, then baa! and finally baaaa!, 
# P will then call inspect on the string which results in the output above.

# Cow inherits from farmanimal. Therefore when speak is called on Cow it will, through the method lookup chain, find a speak method in Cow.
# There it will jump to the Farmanimal#speak method, since super is called. 
# Here string interpolation is called on self.
# self inside of a class, inside of an instance method is the orignal calling object.
# So a string representation of the object is retuned and will be concatenated with "says "
# Ruby then continue execution of the original speak method, concatanting "mooooo!" with the above string.
# P will then call inspect on the string which results in the output above.



