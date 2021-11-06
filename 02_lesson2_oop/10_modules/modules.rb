module Swimmable
  def swim
    "swim"
  end
end

class Dog
  include Swimmable
end

class Cat
  include Swimmable
end

