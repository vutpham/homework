require_relative 'tile'

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file
    lines = File.readlines("./puzzles/sudoku1.txt").map(&:chomp)
    boxes = lines.map do |line|
      line.split("").map do |number|
        num = number.to_i
        if num == 0
          Tile.new(0, false)
        else
          Tile.new(num, true)
        end
      end
    end
    Board.new(boxes)
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col].value = value
  end

  def render
    puts "   0 1 2 3 4 5 6 7 8"
    grid.each_with_index do |row, i|
      values = row.map { |tile| tile.value }
      puts "#{i}  #{values.join(" ")}"
    end
    nil
  end

  def solved?

  end
end
