class Queue
  def initialize(val = [])
    @val = val
  end

  attr_accessor :val

  def enqueue(el)
    @val.unshift(el)
  end

  def dequeue
    @val.pop
  end

  def show
    @val
  end
end

p queue = Queue.new
p queue.enqueue(1)
p queue.enqueue(2)
p queue.enqueue(3)
p queue.dequeue
p queue.show
p queue.dequeue
p queue.show
p queue.dequeue
p queue.show
