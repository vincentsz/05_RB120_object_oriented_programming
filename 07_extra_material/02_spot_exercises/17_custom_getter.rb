# Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`.
#  Custom getter methods are useful when we want to implement some code that prevents direct exposure of an ivar.
# For instance, if the ivar contains sensitive information that we wouldnt want to show, like a social security number, 
# we could use a custom getter method to hide (parts of) this number:

class Person
  def initialize(name, ssn)
    @name = name
    @ssn = ssn
  end

  def show_ssn
    puts ssn
  end

  private

  def ssn
    "XXXX_XXXX_" + @ssn[-4, 4]
  end
end


bob = Person.new('Bob', '1111_1111_1111')
bob.show_ssn
