class Actor
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(new_name)
    @name = new_name.upcase!
  end
end

brad = Actor.new('Brad Pitt')
result = (brad.name = 'Leonardo di Caprio')

puts result     # => LEONARDO DI CAPRIO
puts brad.name  # => LEONARDO DI CAPRIO