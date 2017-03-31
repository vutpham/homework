class HumanPlayer
  attr_reader :name

  def initialize(name = 'Bob')
    @name = name
  end

  def prompt
    puts "pick a card position (row, col)"
    gets.chomp.split(",").map(&:to_i)
  end

end

class ComputerPlayer
  attr_accessor :known_cards, :matched_cards, :board

  def initialize(name = 'Computer Player')
    @board = Board.new
    @name = name
    @known_cards = {} # Key = num; val = pos
    @matched_cards = []
  end

  def prompt #return a randomized position
    all_pos = []
    @board.grid.each_with_index do |row, i|
      row.each_index do |j|
        all_pos << [i, j]
      end
    end
  end

  def receive_revealed_card(pos, val)

  end

  def receive_match(pos1, pos2)
  end
end
