class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length, @game_over, @seq = 1, false, []
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
    show_sequence
    sleep(3)
    system("clear")
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    p add_random_color
  end

  def require_sequence
    puts "Your turn."
    guess = 0
    until guess == sequence_length
      input = gets.chomp
      unless input == @seq[guess]
        @game_over = true
        break
      end
      guess += 1
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Good job!"
  end

  def game_over_message
    puts "Wrong color. Game over."
  end

  def reset_game
    @sequence_length, @game_over, @seq = 1, false, []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
