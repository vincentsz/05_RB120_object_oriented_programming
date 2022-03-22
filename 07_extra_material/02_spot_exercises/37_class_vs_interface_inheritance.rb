# When should we use class inheritance vs. interface inheritance?

# Both modules and classes are used to achieve inheritance in Ruby. 
# Classes are used for class inheritance, 
# meaning that each subclass will inherit its behavior from one other class, the parent class, this is single inheritance.
# We use this kind of inheritance when the behavior that's inherited fits a clear hierarchical structure.
# A superclass has a "is a" - relationship with its subclasses. (ex.: a Dog is an Animal)
# Ruby does not allow for multiple inheritance (a class cannnot inherit from multiple classes), Rubys answer to this is interface inheritance. 
# This means that a class will inherit behavior from a module (also called a mix-in) that is included in the class. 
# Interface inheritance is helpful when the behavior we want to inherit does not fit a hierarchical structure. 
# For instance we have a Dog class that inherits from an Animal class.
# We want our Dog class to have the `swim` behavior. Since not all, but some, animals can swim we do not want it to be defined in the Animal class. 
# At the same time, we wouldn't want to define it in every class that can swim, since we dont want to repeat ourselves (DRY). 
# In this instance we can use a Module. We define it only once and mix it in where necesarry.
# Classes have a "has a" - relationship with their modules. (ex.: 'has a ability to walk' => Walkable)
# We can mix-in an unlimited amount of modules. We can't instantiate objects from modules. Other use cases for modules are namespacing and module methods.