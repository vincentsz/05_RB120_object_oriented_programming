class Dog
  LEGS = 4
end

class Cat
  def num_of_legs
    Dog::LEGS
  end
end

tarzan = Cat.new
tarzan.num_of_legs