# Consider the following code:
class Pet
  attr_reader :animal, :name

  def initialize(shelter, animal, name)
    @animal = animal
    @name = name
    shelter.animals << self
  end

  def to_s
    "A #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end

  def puts_pets
    puts pets
  end

  def to_s
    name
  end
end

class Shelter
  attr_reader :owners, :animals

  def initialize
    @owners = []
    @animals = []
  end

  def adopt(owner, pet)
    owner.pets << animals.delete(pet)
    owners << owner unless owners.include?(owner)
  end

  def print_adoptions
    owners.each do |owner|
      puts "#{owner} has adopted the following pets:"
      owner.puts_pets
      puts ""
    end
  end

  def print_non_adoptions
    puts "The Animal Shelter has the following unadopted pets:"
    puts animals
    puts ''
  end

  def number_of_pets
    animals.size
  end
end


shelter = Shelter.new

butterscotch = Pet.new(shelter, 'cat', 'Butterscotch')
pudding      = Pet.new(shelter, 'cat', 'Pudding')
darwin       = Pet.new(shelter, 'bearded dragon', 'Darwin')
kennedy      = Pet.new(shelter, 'dog', 'Kennedy')
sweetie      = Pet.new(shelter, 'parakeet', 'Sweetie Pie')
molly        = Pet.new(shelter, 'dog', 'Molly')
chester      = Pet.new(shelter, 'fish', 'Chester')
astra        = Pet.new(shelter, 'dog', 'Asta')
laddie       = Pet.new(shelter, 'dog', 'Laddie')
fluffy       = Pet.new(shelter, 'cat', 'Fluffy')
kat          = Pet.new(shelter, 'cat', 'Kat')
ben          = Pet.new(shelter, 'cat', 'Ben')
chatterbox   = Pet.new(shelter, 'parakeet', 'Chatterbox')
bluebell     = Pet.new(shelter, 'parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
shelter.print_non_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The animal shelter has #{shelter.number_of_pets} adopted pets."
# Write the classes and methods that will be necessary to make this code run, and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#    ...

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.