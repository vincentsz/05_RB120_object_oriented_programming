# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_name(full_name)
  end

  def name
    @first_name + ' ' + @last_name
  end

  def name=(full_name)
    parse_name(full_name)
  end

  private

  def parse_name(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name