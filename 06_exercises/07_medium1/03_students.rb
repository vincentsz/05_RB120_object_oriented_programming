# Below we have 3 classes: Student, Graduate, and Undergraduate. 
# The implementation details for the #initialize methods in Graduate and Undergraduate are missing. 
# Fill in those missing details so that the following requirements are fulfilled:

#     Graduate students have the option to use on-campus parking, while Undergraduate students do not.

#     Graduate and Undergraduate students both have a name and year associated with them.

# Note, you can do this by adding or altering no more than 5 lines of code.
class StudentBody
  @@total_students = 0

  def initialize
    @@total_students += 1
  end
end

class Student < StudentBody
  def initialize(name, year)
    @name = name
    @year = year
    super()
    @student_number = @@total_students
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name,year)
    @parking = parking
  end
end

class Undergraduate < Student; end

paul = Undergraduate.new("Paul", 2022)
tom = Graduate.new("Tom", 2019, "2A")
mary = Graduate.new("Mary", 2019, "5A")

p paul
p tom
p mary