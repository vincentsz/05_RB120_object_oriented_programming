class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    self.name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name


# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`? 

# In the change_name method name is not prepended by self, thus Ruby thinks this is a local variable instead of 
# the name= setter method we defined through the attr_accessor method.
# Here, we are assigning that local variable to an upcase method call on itself. 
# Since it is already initialised but not yet assigned, at that point, name will reference nil,
# raising the NoMethodError, since the NilClass does not provide an upcase method.
# At this point we can say that the local variable name will be variable shadowing our name getter method. 
# To fix this problem we should prepend self to name as such:

# def change_name
#   self.name = name.upcase
# end

# self.name = name.upcase is Rubys syntactical sugar way of saying self.name=(name.upcase)
# Ruby now understands we are performing a name= method call on the calling object 
# to which we are sending as an argument the return of the upcase method call on the name getter method.