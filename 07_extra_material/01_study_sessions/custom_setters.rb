class Cat
  attr_accessor :type
  attr_reader :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def age=(a)
    @age = a if a.class == Integer
  end

  def make_one_year_older(num)
    @age =+ num
  end
end

kitty = Cat.new('domestic')

 kitty.make_one_year_older("one")
 p kitty.age
 kitty.make_one_year_older(1)
 p kitty.age

 class Cat
  attr_accessor :type
  attr_reader :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def age=(a)
    @age = a if a.class == Integer
  end

  def make_one_year_older(num)
    self.age =+ num
  end
end

kitty = Cat.new('domestic')

 kitty.make_one_year_older("one")
 p kitty.age
 kitty.make_one_year_older(1)
 p kitty.age