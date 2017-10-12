

def sluggish_octopus(arr)
  longest = arr[0]
  arr.each do |i|
    arr.each do |j|
      longest = i if i.length > j.length
    end
  end

  longest
end

class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)
    return self if length < 2
    prc ||= Proc.new {|x,y| x <=> y}
    mid = length / 2

    left = take(mid).merge_sort(&prc)
    right = drop(mid).merge_sort(&prc)

    Array.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first,right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right
  end

end

def clever_octopus(arr)
  longest = arr[0]
  (1...arr.length).each do |i|
    longest = arr[i] if arr[i].length > longest.length
  end
  longest
end

# arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"
# p sluggish_octopus(arr)
# arr.merge_sort {|x,y| x.length <=> y.length}.last #Dominant Octopus
# p clever_octopus(arr)

def slow_dance(step, arr)
  arr.each_index do |i|
    return i if arr[i] == step
  end
end

def fast_dance(step, hash)
  hash.key(step)
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# p slow_dance("up", tiles_array) # => 0
# p slow_dance("right-down", tiles_array) # => 3

tiles_hash = [[0,"up"], [1,"right-up"], [2,"right"], [3,"right-down"], [4,"down"], [5,"left-down"], [6,"left"],  [7,"left-up"]].to_h
# p fast_dance("up", tiles_hash)  # => 0
# p fast_dance("right-down", tiles_hash)  # => 3
