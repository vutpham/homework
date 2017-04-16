require_relative 'card.rb'


class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(4) { Array.new(4) } # add initial value?

  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, card)
    row, col = pos
    grid[row][col] = card
  end

  def populate
    values = (0...(grid.flatten.size / 2)).to_a * 2
    values.shuffle!


    (0..grid.size - 1).each do |i|
      grid.each do |col|
        next_value = values.shift
        col[i] = Card.new(next_value)
      end
    end
  end

    # grid.each_with_index do |row, i|
    #   row.each_index do |j|
    #     next_value = values.shift
    #
    #
    #     self[i, j] = Card.new(next_value)
    #   end
    # end

  def render
    puts "   0  1  2  3"
    puts "   ----------"
    grid.each_with_index do |row, i|
      card_face = row.map { |card| card.display }
      puts "#{i}| #{card_face.join("  ")}"
    end
  end

  def won?

    grid.flatten.all?(&:face_up)
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
  end
end
