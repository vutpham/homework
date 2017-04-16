require_relative 'card'
require_relative 'board'
require_relative 'players'
# require 'byebug'

class Game
  attr_accessor :board, :previous_guess, :guessed_pos, :player

  def initialize(player = HumanPlayer.new(name))
    @board = Board.new
    @player = player
    @previous_guess = nil
    @guessed_pos = nil
  end

  def play
    @board.populate

    until board.won?
      display
      make_guess(player.prompt)
      display
      make_guess(player.prompt)
      sleep(1)
    end
    puts "Congrats #{player.name} wins!!"
  end

  def make_guess(pos)

    if previous_guess.nil?
      board[pos].reveal
      @previous_guess = pos
    else
      @guessed_pos = pos
      board[@guessed_pos].reveal

      display
      unless match?(@previous_guess, @guessed_pos)
        board[previous_guess].hide
        board[guessed_pos].hide
      end
      @previous_guess = nil
    end


    # debugger
    # if previous_guess.nil?
    #   board[pos].reveal
    #   @previous_guess = pos
    # else
    #   @guessed_pos = pos
    #   board[@guessed_pos].reveal
    #   unless match?(@previous_guess, @guessed_pos)
    #     board[previous_guess].hide
    #     board[guessed_pos].hide
    #   end
    #   @previous_guess = nil
    # end
  end

  def match?(pos1, pos2)
    card1 = board[pos1]
    card2 = board[pos2]

    card1.face_value == card2.face_value
  end

  def display
    system("clear")
    board.render
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "What is your name?"
  name = gets.chomp

  Game.new(HumanPlayer.new(name)).play

end
