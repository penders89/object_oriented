require 'pry'
class CircularQueue
  attr_accessor :queue, :starting_point
  
  def initialize(size)
    @queue = [nil] * size
    @starting_point = 0
  end
  
  def full_entries
    queue.select { |x| x}.size
  end
  
  def enqueue(item)
    if full_entries == queue.length
      queue[@starting_point] = item
      @starting_point = (@starting_point + 1) % queue.size
    else
      queue[(@starting_point + full_entries) % queue.size] = item
#binding.pry
    end
  end
  
  def dequeue
    if full_entries == 0
      return nil
    else
      value = queue[starting_point]
      queue[starting_point] = nil
      @starting_point = (@starting_point + 1) % queue.size
    end
    value
  end
  
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

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
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

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
puts queue.dequeue == nil