class Monkey
  attr_reader :bananas
  def initialize(bananas)
    @bananas = bananas
  end

  def ==(other)
    bananas == other.bananas
  end

end

monkey1 = Monkey.new(5)
monkey2 = Monkey.new(5)

monkeys = { monkey1 => "I have bananas" }

# monkey 1 is in the hash
p monkeys[monkey1]      # => "I have bananas"
# monkey 2 is not in the hash, but has the same number of bananas
p monkeys[monkey2]      # => nil