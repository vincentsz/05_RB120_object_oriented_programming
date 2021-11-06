=begin
Create a class 'Student' with attributes name and grade. 
Do NOT make the grade getter public, so joe.grade will raise an error. 
Create a better_grade_than? method, that you can call like so...

puts "Well done!" if joe.better_grade_than?(bob)
=end

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
  self.name = name
  self.grade = grade
  end

  def better_grade_than?(person)
    self.grade > person.grade 
  end

  protected
  attr_reader :grade
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 80)
puts "Well done!" if joe.better_grade_than?(bob)

#textbook
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_person)
    grade > other_person.grade
  end

  protected
  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)


