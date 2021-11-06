# Consider the following code:
class Pet 
  def initialize(species, pet_name, shelter)
    @species = species
    @pet_name = pet_name
    shelter.add_pet(self)
  end

  def to_s
    "a #{@species} named #{@pet_name}"
  end
end

class Shelter
  def initialize
    @all_owners = []
    @all_pets = []
  end

  def add_pet(pet)
    @all_pets << pet
  end

  def adopt(owner, pet)
    owner.add_pets(pet)
    @all_pets.delete(pet)
    add_owner(owner) unless @all_owners.include?(owner)
  end

  def add_owner(owner)
    @all_owners << owner
  end

  def number_of_pets
    @all_pets.size
  end

  def print_adoptions
    @all_owners.each do |owner|
      puts "#{owner.owner_name} has adopted the following pets:"
      owner.print_pets
    end

    puts "The Animal Shelter has the following unadopted pets:"
    puts @all_pets
  end

end

class Owner
  attr_reader :adopted_pets, :owner_name

  def initialize(owner_name)
    @owner_name = owner_name
    @adopted_pets = []
  end

  def add_pets(pet)
    @adopted_pets << pet
  end

  def print_pets
    puts adopted_pets
  end

  def number_of_pets
    @adopted_pets.size
  end
end

shelter = Shelter.new

butterscotch = Pet.new('cat', 'Butterscotch', shelter)
pudding      = Pet.new('cat', 'Pudding', shelter)
darwin       = Pet.new('bearded dragon', 'Darwin', shelter)
kennedy      = Pet.new('dog', 'Kennedy', shelter)
sweetie      = Pet.new('parakeet', 'Sweetie Pie', shelter)
molly        = Pet.new('dog', 'Molly', shelter)
chester      = Pet.new('fish', 'Chester',shelter)
asta         = Pet.new('dog', 'Asta',shelter)
laddie       = Pet.new('dog', 'Laddie',shelter)
fluffy       = Pet.new('cat', 'Fluffy',shelter)
kat          = Pet.new('cat', 'Kat',shelter)
ben          = Pet.new('cat', 'Ben',shelter)
chatterbox   = Pet.new('parakeet', 'Chatterbox',shelter)
bluebell     = Pet.new('parakeet', 'Bluebell',shelter)

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
puts "#{phanson.owner_name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.owner_name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal shelter has #{shelter.number_of_pets} adopted pets."


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

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.

# The order of the output does not matter, so long as all of the information is presented.