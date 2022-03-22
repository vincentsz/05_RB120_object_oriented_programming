class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak


# What does this code output and why?
# The code outputs: Daisy says moooooooooooo!
# On line 21 a new Cow object daisy is instantiated with a string argument "Daisy". 
# The new class method will, by default, try to call the initialize method (the constructor).
# The Cow class has no intialize method, however, it inherits the initialize method from its superclass Animal.
# Here the @name ivar is assigned to the "Daisy" string.
# On line 22 the speak method is called on the daisy Cow object.
# It will go up the methood lookup chain and find the speak method in the Animal class.
# Here puts gets called on the return of the sound method. 
# Ruby will again go up the methid lookup chain and find a sound method in the Cow class.
# Here, super will be called, and so it will find a sound method in the above Animal class and execute it first before continuing in the Cow#sound method.
# In the Animal#sound method string interpolation will be called on the @name ivar of the daisy object 
# and be concatenedt with the surrounding string, resulting in "Daisy says".
# Then, ruby continues in the original sound method, concatenating "Daisy syas" with "moooooo!". 
# Puts on line 7 will then finally output the concatenated string "Daisy says moooooooooooo!"
