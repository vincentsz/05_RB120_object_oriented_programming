# Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name)
    self.first_name = first_name
    self.last_name = ''
  end

  def name
    first_name + ' ' + last_name
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
puts bob.last_name = 'Smith'
puts bob.name
            
# or

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(first_name)
#     @first_name = first_name
#     @last_name = ''
#   end

#   def name
#     @first_name + ' ' + @last_name
#   end
# end

# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# puts bob.last_name             # => ''
# puts bob.last_name = 'Smith'
# puts bob.name                  # => 'Robert Smith'

# textbook
# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end
# end