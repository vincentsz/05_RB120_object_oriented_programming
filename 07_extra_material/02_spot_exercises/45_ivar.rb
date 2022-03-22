class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end 
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">


# Running the following code will not produce the output shown on the last line. 
# Why not? What would we need to change, and what does this demonstrate about instance variables?

The code outputs #<Student:0x0000000100e12638 @name="Adewale"> and not #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">. 

# We can see that he @grade instance variable is not initialized. We see that the grade parameter in the initialize methd is set to nil, inside of the method however, 
# there is no @grade ivar set to this argument. Since there is no initialization of the @grade ivar anywhere else, it simply doe not exist, as shown in our output.
# What this demonstrates about ivars is that they need to be initialized, meaning, 
# the code that initialises them needs to be run, if they want to become part of an objects state.
# If the @grade ivar would be called, the code would not raise an error however, like it would do with an uninitialezed local variable.
# This is because Ruby, by default, returns nil when it encounters an uninitialzed ivar.