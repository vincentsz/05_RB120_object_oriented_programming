class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
  
  def change_grade(new_grade)
    grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade 


# In the above code snippet, we want to return `”A”`. What is actually returned and why? How could we adjust the code to produce the desired result?

# nil is returned, this because self was ommited from the code on line 10. 
# When the priya object is instantiated on line 14, @grade is set to nil within the initialize method.
# On line 2 an attr_accessor method is defined for the @grade ivar, resulting in a setter method grade= being available.
# When calling setter methods inside of the class however, we are obliged to prepend the method with an explicit self. 
# This to disambiguate the method call form a a local variable assignemnt.
# Right now ruby thinks grade is a new local variable we,re initializing, and there fore @grade will remain assigned to nil. 
# By prepending self to grade, Ruby will know we are calling the setter and change it's value accordingly.