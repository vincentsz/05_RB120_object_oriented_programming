class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
 # nil is output because the name instance variable is not initialized, since the set_name method is never called on the object. Within set name we find the only code where @name is iset to a variable
 # By default unitinialized instance variables return nil, this is different from local variables, retrieveing un unitialized local veriable would result in error being raised.

# What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?
