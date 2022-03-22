class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al.name == alex.name # => true
p al.name.equal?(alex.name) # => false


# In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`? 
# Further, since `al.name == alex.name` returns `true`, 
# does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?

#  Line 11 returns false since al and alex are different objects that just happen to have an identical value assigned to their state (the ivar @name).
#  We can either call the name getter on each respective object in the comparison:
#  p al.name == alex.name
#  or create a custum == method:
#  def ==(other)
#   name == other.name
#  end
#  Both will return true since we are now comapring strings that are identical. 
#  They are not the same object however, both string refer to another space in memory.
#  We can prove this by calling the equal? method on the strings. 
#  equal? returns true when the objects are the same object, meaning that they woiuld have the same object_id.