module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides"
  end
end

class Page
  PAGE_SIDES = 6
  class Shape
    include Describable

    def self.sides
      self::SIDES
    end

    def find_page_sides
      PAGE_SIDES
    end

    def sides
      self.class::SIDES
    end
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral ; end

p Square.sides # => 
p Square.new.sides
p Square.new.find_page_sides
# p Square.new.describe_shape