# What is the relationship between classes and objects in Ruby?

# Simply put, we can think of classes as molds and objects as the things you produce out of those molds.
# Classes define objects, or alternatively, objects are instantiated from a class. Each instantiated object is unique while belonging to a class.
# A class is where behaviors (instance methods) and attributes (instance variables) of objects are defined and grouped.
# The behaviors are scoped at the class level. Therefore instance methods defined in a class are available to all objects of that class.
# This means that all objects of a class share the same behaviors.
# Instance variables are scoped at the object level, meaning they are only available to that object; state is unique to the object.