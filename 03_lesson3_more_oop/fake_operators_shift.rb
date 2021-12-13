class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Team
  attr_accessor :team, :members

  def initialize(team)
    @team = team
    @members = []
  end

  def <<(person)
    members.push person
  end

  def+(other_team)
    temp_team = Team.new("Temporary team")
    temp_team.members = members + other_team.members
    temp_team
  end
end

duivels = Team.new("Rode Duivels")
duivels << Person.new("Thomas", 17)
duivels << Person.new("Corey", 34)

oranje = Team.new("Oranje")
oranje << Person.new("Joop", 23)
oranje << Person.new("Tim", 18)

dream_team = duivels + oranje
p dream_team
