class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.


# We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?

# In our change_info method Ruby thinks that name, height and weight are local variables instead of the setter methods we defined through our attr_accessor method.
# This is because they are not prepended by self. In Ruby, when we want to call setter methods we have to provide an explicit caller 
# to let Ruby know we are not initializing a local variable but calling a setter method.