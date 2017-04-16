class Game
  attr_reader :dictionary
  attr_accessor :fragment, :player1, :player2, :current_player,
                :previous_player, :losses

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    #@dictionary = File.open('dictionary.txt', 'r')
    @dictionary = ["at", "aardvark", "abaci", "aback"]
    @fragment = ""
    @losses = {player1 => 0, player2 => 0}
  end

  def play_round
    @current_player = [@player1, @player2].sample

    until game_over?
      take_turn(current_player)
      puts "#{fragment}"
      next_player!
    end
    puts "#{@previous_player.name.upcase} LOSES!!!"
    @losses[@previous_player] += 1
    puts "GHOST"[0...@losses[@previous_player]]
  end

  def next_player!
    if @current_player == player1
      @current_player, @previous_player = player2, player1
    else
      @current_player, @previous_player = player1, player2
    end
  end

  def take_turn(current_player)
    guess = current_player.guess
    fragment << guess

    # If we care later, fix to redo guess if invalid play...
    current_player.alert_invalid_guess unless valid_play?
  end

  def valid_play?
    dictionary.any? {|word| word.start_with?(fragment) }
  end

  def game_over?
    dictionary.include?(fragment)
  end

  def run
    until @losses[@previous_player] == "GHOST".length
      play_round
      display_standings
      @fragment = ""
    end
  end

  def display_standings
    puts "#{@current_player.name}: #{@losses[current_player]} || #{@previous_player.name}: #{@losses[previous_player]} "
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    print "#{name}: Add a letter to the fragment: "
    guess = gets.chomp.downcase
  end

  def alert_invalid_guess
    puts "WRONG AND DO BETTER PLEASE"
  end
end

if __FILE__==$PROGRAM_NAME
  game = Game.new(Player.new("player 1"), Player.new("player 2"))
  game.run
end
