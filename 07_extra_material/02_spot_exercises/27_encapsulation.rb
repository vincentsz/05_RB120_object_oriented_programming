# How does encapsulation relate to the public interface of a class?

# Encapsulation means hiding parts of the code's functionality to the codebase, it's an essential aspect of OOP. 
# Ruby does this by creating objects and exposing methods to them. 
# This means that objects encapsulate behaviors and additionally, state. 
# These behaviors and states are only accessible through the methods we are exposing to the object, this is what we call the public interface of a class.
# In Ruby we use method access control to expose or hide methods, these are tools that help us manage encapsulation in Ruby. 
# In Ruby this is done thorugh the method calls `public`, `private`and `protected`. 
# All methods other than `initialize` are public by default, unless indicated otherwise.