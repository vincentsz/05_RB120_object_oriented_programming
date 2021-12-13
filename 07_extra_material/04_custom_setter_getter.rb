class Animals
  def initialize
    @zoo = []
  end
  
  def <<(animal)
    @zoo << animal
  end
  
  def [](idx)
    @zoo[idx]
  end
end

zoo = Animals.new

zoo << "zebra"

p zoo[1]