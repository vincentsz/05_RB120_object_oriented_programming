# Using the following code, multiply @age by 2 upon assignment, then multiply @age by 2 again when @age is returned by the getter method.

# class Person
#   def age
#     @age * 2
#   end

#   def age=(num)
#     @age = num * 2
#   end    
# end

# person1 = Person.new
# person1.age = 20
# puts person1.age

# Expected output:

# 80

#refactored
class Person
  def age
    doubled(@age)
  end

  def age=(num)
    @age = doubled(num)
  end
  
  private

  def doubled(num)
    num * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age


