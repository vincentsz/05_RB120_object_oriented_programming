class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels     


# What does the code above output, and why? 
# What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?

# class Vehicle
#   @@wheels = 4

#   def self.wheels
#     @@wheels
#   end
# end

# p Vehicle.wheels    #=> 4                         

# class Motorcycle < Vehicle
#   @@wheels = 2
# end

# p Motorcycle.wheels #=> 2                      
# p Vehicle.wheels         #=> 2                     

# class Car < Vehicle; end

# p Vehicle.wheels #=> 2
# p Motorcycle.wheels   #=> 2                        
# p Car.wheels     #=> 2

# This demonstrates that class variables will be shared between classes that inherit from each other. 
# Meaning that in this case there always will be just one @@wheels class variable being shared between our Vehicle, Motorcycle and Car class.
# We should avoid using class variables when working with inheritance because 
# any subclass could unknowingly change the shared class variable resulting in unituitive and therefore dangerous behavior.
