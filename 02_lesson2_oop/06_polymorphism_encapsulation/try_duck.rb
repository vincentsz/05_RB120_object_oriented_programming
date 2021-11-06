class Wedding
  attr_reader :guests, :songs, :flowers

  def initialize
    @guests = ["Tom", "Bob"]
    @songs = ["Techno", "House"]
    @flowers = ["roses", "lilies"]
  end

  def prepare(preparers)
    preparers.each do |preparer| 
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    cook_food(wedding.guests)
  end

  def cook_food(guests)
    puts "Create food for #{guests[0]} and #{guests[1]}."
  end
end

lillie_bianca = Wedding.new
lau = Chef.new
staff = [lau]
lillie_bianca.prepare(staff)
