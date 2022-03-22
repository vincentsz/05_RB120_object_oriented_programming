# What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.

# Collaborator objects are any object saved in the state of another object. They can belong to any class, including custom classes.
# They are used in OOP to represent connections between various actors in your program, it's a way of modeling relationships between objects.
# For instance an Architect would be collaborator objects of a Constructionproject.

class ConstructionProject
  attr_writer :architect
end

class Architect
  def initialize(name)
    @name = name
  end
end

main_street = ConstructionProject.new
bob = Architect.new('bob')
main_street.architect = bob
p main_street