# A fixed-length array is an array that always has a fixed number of elements.
# Write a class that implements a fixed-length array, 
# and provides the necessary methods to support the following code:
# class FixedArray
#   attr_reader :collection

#   def initialize(length)
#     @collection = [nil] * length
#   end

#   def to_a
#     collection
#   end

#   def []=(index, value)
#     collection.fetch(index)
#     collection[index] = value
#   end

#   def [](index)
#     collection.fetch(index)
#   end

#   def to_s
#     collection.to_s
#   end
# end

# textbook

class FixedArray
  attr_reader :collection

  def initialize(length)
    @collection = Array.new(length)
  end

  def to_a
    collection.clone
  end

  def []=(index, value)
    self[index]
    collection[index] = value
  end

  def [](index)
    collection.fetch(index)
  end

  def to_s
    to_a.to_s
  end

end


fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

# The above code should output true 16 times.