require_relative 'board'

class Game
  attr_reader :board

  def initialize
    @board = Board.from_file
  end

  def play
    until solved?
      prompt
      
    end
  end

  def prompt
    get_input
  end

  def get_input
    print "Enter position to mark: "
    position = gets.chomp.split(",").map(&:to_i)
    puts "Enter value: "
    value = gets.chomp.to_i
    [position, value]
  end

  def validate_input(pos)
    board[pos].value == 0 && pos.all? {|num| num.between?(1, 9)}
  end

end
