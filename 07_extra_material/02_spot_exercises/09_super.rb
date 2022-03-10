class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno


# What is output and why? What does this demonstrate about `super`?

# <GoodDog: object_id, @color = "brown", @name = "brown"> Is ouput. This shows us that both the @color and @name ivars are assigned to the "brown" string.
# It demonstrates that super without any parentheses, will send up the argument that's passed in, when looking for a similarly named method up the lookup chain.

# In this code the new method call on the GoodDog class will result in the initialize method being called from the Gooddog class. 
# Since we pass "brown" into the new method. It will be avaiable as the color  variable in the Gooddog#initialize method. 
# Since we call super without parentheses, the string will be sent to the next initialize method in the lookup chain, which is Animal#initialize.
# There, finally it will be assigned to te @nameivar.
# Ruby then returns to the orignal initialize method to execute the remaining code. 
# There @color will be assigned to the "brown" string as well.