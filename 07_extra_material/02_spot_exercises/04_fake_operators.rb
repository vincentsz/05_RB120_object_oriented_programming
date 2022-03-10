class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes 


# # What is output? Is this what we would expect when using `AnimalClass#+`? 
# If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?

# An Array object is output. We'd expect another AnimalClass object. 
# This because in the standard library + always returns the same type of object than the one its called upon. Ex. String#+ returns a String object. 
# We want custom methods to follow the pattern of the standard library.
# So we'd have to adapt the AnimalClass#+ method to return an AnimalClass object. This can be done accordingly:

def +(other_class)
  temp_object = Animalclass.new("temp name")
  temp_object.animals = animals + other_class.animals
  temp_object
end

# So within the method we concatenate the two respective @animals ivars, which are arrays, 
# and assign it to the @animals ivar from our newly created AnimalClass object.
# Lastly we return this object.
