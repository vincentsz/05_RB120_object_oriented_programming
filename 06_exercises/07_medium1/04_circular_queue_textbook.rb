class CircularQueue
  attr_reader :collection, :start, :length, :end

  def initialize(size)
    @size = size
    @collection = [nil] * size
    @oldest = 0
    @next = 0
  end

  def enqueue(element)
    unless @collection[@next] == nil
      @oldest = (@next + 1) % @size
    end

    @collection[@next] = element
    @next = (@next + 1) % @size
  end

  def dequeue
    removed = nil
    unless @collection[@oldest] == nil
      removed = @collection[@oldest]
      @collection[@oldest] = nil
      @oldest = (@oldest + 1) % @size
    end
    removed
  end
end
queue = CircularQueue.new(3)

puts queue.dequeue.nil?

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue.nil?

queue = CircularQueue.new(4)
puts queue.dequeue.nil?

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue.nil?