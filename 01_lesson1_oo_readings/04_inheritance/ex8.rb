class Student
  def public_hi
    hi
  end

  private
  def hi
    puts "Hi"
  end

end

joe = Student.new
joe.public_hi