class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    prepares.each do |preparer|
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    cook_food(wedding.guests)
  end

  def cook_food(guests)
    #implementation
  end
end

class Florist
  def prepare_wedding(wedding)
    decorate(wedding.flowers)
  end

  def decorate(flowers)
    #implementation
  end
end

class Musician
  def prepare_wedding(wedding)
    play_songs(wedding.songs)
  end

  def play_songs(songs)
    #implemenation
  end
end
