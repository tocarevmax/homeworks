class Stack
  def initialize(val = [])
    # create ivar to store stack here!
    @val = val
  end

  attr_accessor :val

  def add(el)
    # adds an element to the stack
    @val.push(el)
  end

  def remove
    # removes one element from the stack
    @val.pop
  end

  def show
    # return a copy of the stack
    @val
  end
end

# LIFO

p stack = Stack.new
p stack.add(3)
p stack.add(5)
p stack.remove
p stack.show
p stack.add(5)
p stack.remove
p stack.show
