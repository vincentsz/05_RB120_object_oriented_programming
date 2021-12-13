module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    'swimming' if @can_swim
  end
end

toby = Dog.new
toby.enable_swimming
toby.swim