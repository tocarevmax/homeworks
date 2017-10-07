require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    if game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    # debugger
    puts "Sequence is: "
    p show_sequence
    sleep(2)
    system("clear")
    success = require_sequence
    round_success_message if success
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq
  end

  def require_sequence
    puts "Please repeat the sequence"
    puts
    (seq.length).times do |i|
      next if @seq[i].nil?
      print "Color #{i+1} is "
      input = gets.chomp
      if input != @seq[i]
        @game_over = true
        return false
      end
    end
  end

  def add_random_color
    @seq += [COLORS.sample]
  end

  def round_success_message
    puts
    puts "Well done, let's try another color."
    puts "------------------------------------"
    sleep(1)
    system("clear")
  end

  def game_over_message
    puts
    puts "Sorry, game is over, try again."
    print "Correct sequences is "
    p @seq
    puts
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end

Simon.new.play
