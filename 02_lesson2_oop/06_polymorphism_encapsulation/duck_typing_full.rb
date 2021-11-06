class Wedding
  attr_reader :guests, :songs, :flowers

  def initialize
    @guests = ["Bob", "Ross", "Nicole"]
    @songs = ["'eye of the tiger'", "'I will always love you'"]
    @flowers = ["roses", "lillies"]
  end

  def prepare(wedding_planners)
    wedding_planners.each do |planner|
      planner.prepare_wedding(self)
    end
  end
end

class Florist
  def prepare_wedding(wedding)
    set_flowers(wedding.flowers)
  end

  def set_flowers(flowers)
    puts "Put #{flowers[0]} and #{flowers[1]} on the tables!"
  end
end

class Musician
  def prepare_wedding(wedding)
    play_songs(wedding.songs)
  end

  def play_songs(songs)
    puts "Play #{songs[0]} first and then #{songs[1]}."
  end
end

class Chef
  def prepare_wedding(wedding)
    cook_food(wedding.guests)
  end

  def cook_food(guests)
    puts "Prepare food for #{guests[0]}, #{guests[1]} and #{guests[2]}."
  end
end

tom_fred = Wedding.new
rachel = Florist.new
the_dobidoos = Musician.new
bianca = Chef.new
wedding_planners = [rachel, the_dobidoos, bianca]
tom_fred.prepare(wedding_planners)