# What is the difference between instance methods and class methods?

# Instance methods expose behavior for objects, behaviors are what objects are capable of doing.
# They are scoped at the class level; instance methods defined in a class are available to objects of that class.
# This means that all objects of a class share the same behaviors.
# Instance methods have acces to both instance variables and class variables.

# Class Methods (or singleton methods) are methods that we call on the class itself, without instantiating objects.
# It's where we put functionality that pertains to a class level detail and not to any object's state, 
# this means that that it will contain a generic action a class may execute.
# Within a class method we're restricted from adding data specific to objects of the class.
# This means that class methods do not have access to instance variables, only to class variables.