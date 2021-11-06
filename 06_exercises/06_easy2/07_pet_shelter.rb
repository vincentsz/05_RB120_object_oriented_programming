# Consider the following code:
class Pet 
  def initialize(species, pet_name)
    @species = species
    @pet_name = pet_name
  end

  def to_s
    "a #{@species} named #{@pet_name}"
  end
end

class Shelter
  def initialize
    @all_owners = []
  end

  def adopt(owner, pet)
    owner.add_pets(pet)
    add_owner(owner) unless @all_owners.include?(owner)
  end

  def add_owner(owner)
    @all_owners << owner
  end

  def print_adoptions
    @all_owners.each do |owner|
      puts "#{owner.owner_name} has adopted the following pets:"
      owner.adopted_pets.each do |pet|
        puts pet
      end
    end
  end
end

class Owner
  attr_reader :owner_name

  def initialize(owner_name)
    @owner_name = owner_name
    @adopted_pets = []
  end

  def add_pets(pet)
    @adopted_pets << pet
  end

  def number_of_pets
    @adopted_pets.size
  end
end



butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
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

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# The order of the output does not matter, so long as all of the information is presented.