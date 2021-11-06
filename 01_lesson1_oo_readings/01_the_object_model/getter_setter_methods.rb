class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} syas arf!"
  end

  def change_info(n, h ,w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "Name is#{self.name}, height is #{self.height}, weight is #{self.weight}."
  end
end

sparky =  GoodDog.new('Sparky', '1.5m', '5kg')
puts sparky.info
sparky.change_info('Spartacus','0.5m', '3kg')
puts sparky.info
