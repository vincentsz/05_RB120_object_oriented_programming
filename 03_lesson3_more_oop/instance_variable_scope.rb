class Person
  @name = 'bob'
  
  def get_name
    @name
  end
end

joe = Person.new

p joe.get_name