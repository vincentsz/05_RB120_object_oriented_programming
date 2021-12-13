class Person
  TITLES = ['Mr', 'Dr', 'Ms', 'Mrs']

  attr_reader :name

  def self.titles
    TITLES.join(', ')
  end

  def initialize(n)
    @name = "#{TITLES.sample} #{n}"
  end
end

joe = Person.new('Joe')

Person.titles
joe.name