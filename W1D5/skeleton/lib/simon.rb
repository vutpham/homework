class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless @game_over            # When the game is not over
      self.round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    self.add_random_color
    @seq
  end

  def require_sequence
    if input != show_sequence
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "One more color for you!"
  end

  def game_over_message
    puts "Sorry, you lose after #{sequence_length - 1} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end
