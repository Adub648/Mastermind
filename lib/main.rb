require_relative 'human'
require_relative 'computer'
require_relative 'display'
require_relative 'gameLogic'

class Main
  include Display

  # work out what type of game user wants to play
  def initialize_game
    puts 'Would you like to play as the human guesser, or have the computer guess your code? Please enter "h" or "c".'
    puts "\n"

    answer = gets.chomp

    # if they want to guess
    if answer == 'h'
      puts "\n"
      game = Human.new
      game.start_game
    # if they want to make the code
    elsif answer == 'c'
      puts "\n"
      game = Computer.new
      game.start_game
    else
      # error handling
      puts 'You have not entered the right input! Please try again.'
      puts "\n"
      initialize_game
    end
  end

  # ask the user if they would like to play again
  def play_again
    puts 'Would you like to play again? Type "Y" or "N".'
    puts "\n"
    answer = gets.chomp.downcase

    # if they said yes
    if answer == 'y'
      puts 'Yay, another game!'
      puts "\n"
      initialize_game
    else
      # if they didn't say yes
      puts 'Thanks for playing!'
      exit
    end
  end
end

# start the game
game = Main.new
puts game.display_info
game.initialize_game
