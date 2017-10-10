class Player


  def initialize(name, side)
    @name = name
    @side = side
  end

  attr_accessor :name, :side

  def prompt
    puts "Hello #{@name}, make a move"
    start_pos = gets.chomp.to_i
    if (start_pos.between?(1,6) && @side != 1 ||
        start_pos.between?(7,12) && @side != 2)
      raise "Wrong move"
    else
      start_pos
    end
  end
end
