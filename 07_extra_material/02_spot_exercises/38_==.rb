class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new


# If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`? Why or why not? 
# What does this demonstrate about classes and objects in Ruby, as well as the `==` method?

# The return value will be false, since each instantiated object is unique. 
# This demonstrates that classes define objects, that are unique when instantiated.

# Since no `== `method is defined in the Cat class.
# The default `==` method that is defined in the `BasicObject` class is called on the Cat object.
# Here its implementation is the same as the `equal?` method, so `==`, when not defined in the class, compares object-ids,
# essentially asking if two objects are the same object.

# `==`, defined outside of the `Object` level, should verify if specific values within the two objects are the same,
# exactly which values are compared, is determined in the class.
# Most Ruby core library classes come with their own `==` method.
# When defining `==`, `!=` follows suit.