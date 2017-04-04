class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      @cups[i] += [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 14)
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    start_count = @cups[start_pos].count
    @cups[start_pos] = []

    j = 1
    until start_count == 0
      cup_num = (start_pos + j) % 14
      if cup_num == 13 && current_player_name == @name1
        j += 1
      elsif cup_num == 6 && current_player_name == @name2
        j += 1
      else
        cups[cup_num] += [:stone]
        start_count -= 1
        return :switch if start_count == 0 && cups[cup_num].empty?
        j += 1
      end
    end
    render
    next_turn(cup_num)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty? } || cups[7..12].all? {|cup| cup.empty? }
  end

  def winner
    return :draw if cups[6].count == cups[13].count
    if @cups[6].count > @cups[13].count
      return @name1
    else
      return @name2
    end
  end
end
