class CircularQueue
  @@total = 0
  attr_reader :queue

  def initialize(size)
    @size = size
    @queue = Array.new(size) { |idx| CQObject.new(idx) }
  end

  def enqueue(value)
    @@total += 1
    if empty_queue?
      @queue[0] = CQObject.new(0, value)
    elsif full_queue?
      oldest = find_oldest
      @queue[oldest.idx] = CQObject.new(oldest.idx, value)
    else
      newest = find_newest
      handle_last(newest.idx, value)
    end
  end

  def dequeue
    if empty_queue?
      nil
    else
      oldest = find_oldest
      @queue[oldest.idx] = CQObject.new(oldest.idx)
      oldest.value
    end
  end

  private

  def empty_queue?
    @queue.all? { |el| el.value.nil? }
  end

  def full_queue?
    @queue.all? { |el| !el.value.nil? }
  end

  def find_oldest
    @queue.select { |el| !el.value.nil? }.min_by(&:num)
  end

  def find_newest
    @queue.select { |el| !el.value.nil? }.max_by(&:num)
  end

  def handle_last(newest_idx, value)
    if newest_idx == @size - 1
      @queue[0] = CQObject.new(0, value)
    else
      @queue[newest_idx + 1] = CQObject.new(newest_idx + 1, value)
    end
  end
end

class CQObject < CircularQueue
  attr_reader :idx, :num, :value

  def initialize(idx, value = nil)
    @idx = idx
    @value = value
    @num = @@total
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
