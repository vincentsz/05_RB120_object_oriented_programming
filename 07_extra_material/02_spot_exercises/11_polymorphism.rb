class Animal
  def eat
    puts "I eat."
  end
end

class Fish #< Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog #< Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end


# What is output and why? How does this code demonstrate polymorphism? 

#I eat
#I eat Plankton
#I eat kibble/

# array_of_animals is an array object that contains an Animal, Fish and Dog object. We iterate over this array. 
# For each iterator we call the feed_animal method, passing each object in as an arguent.
# Within the feed_animal method, we call an eat method on each respective object.
# Since each of these classes defines an eat method, the respective string will be output.
# This is polymorphism, since polymorphism is the ability for different types of data to respond to a common interface
# in Ruby this means that objects of different types will report to the same method invocation
# Polymorphism in Ruby is achieved through inheritance (class inheritance & interface inheritance) and duck-typing. 
# In this case, even though there is inheritance happening, the principle at work is polymorphism through duck typing. 
# If you were to get rid of the inheritance the code would still work in the same way, 
# since all eat methods are defined in the classes individually.