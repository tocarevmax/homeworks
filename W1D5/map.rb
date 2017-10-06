class Map

  def initialize(val = [])
    @val = val
  end

  attr_accessor :val

  def assign(key, value)
    remove(key) if lookup(key)
    @val << [key,value]
  end

  def lookup(key)
    @val.each do |kv|
      return kv if kv.first == key
    end
    nil
  end

  def remove(key)
    @val.delete(lookup(key))
  end

  def show
    @val
  end

end

p map = Map.new
p map.assign(:a,"a")
p map.assign(:b,"b")
p map.lookup(:c)
p map.remove(:b)
p map.val
p map.remove(:c)
p map.val
p map.assign(:a,"b")
p map.val

# the keys are always unique
