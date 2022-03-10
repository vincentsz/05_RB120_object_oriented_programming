class Cat1
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

tabby = Cat1.new('Tabby')
p tabby.age
tabby.make_one_year_older
p tabby.age

#In the make_one_year_older method we have used self. 
#What is another way we could write this method so we don't have to use the self prefix?

class Cat2
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age = self.age + 1
  end
end

tabby = Cat2.new('Tabby')
p tabby.age
tabby.make_one_year_older
p tabby.age

class Cat3
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age=(self.age + 1)
  end
end

tabby = Cat3.new('Tabby')
p tabby.age
tabby.make_one_year_older
p tabby.age

class Cat4
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    age = (self.age + 1)
    p age.to_s + 'local var?'
  end
end

tabby = Cat4.new('Tabby')
p tabby.age
tabby.make_one_year_older
p tabby.age

class Cat5
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

tabby = Cat5.new('Tabby')
p tabby.age
tabby.make_one_year_older
p tabby.age

#In the make_one_year_older method we have used self. 
#What is another way we could write this method so we don't have to use the self prefix?

class Cat6
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age = @age + 1
  end
end

tabby = Cat6.new('Tabby')
p tabby.age
tabby.make_one_year_older
p tabby.age

#In the make_one_year_older method we have used self. 
#What is another way we could write this method so we don't have to use the self prefix?