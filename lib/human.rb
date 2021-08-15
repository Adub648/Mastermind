require_relative 'gameLogic'

class Human
  include GameLogic

  # create initial values
  def initialize
    @comp_number = nil
    @computer_game = false
    @guesses = 1
    @input = ""
  end

  # use functions to begin game
  def start_game
    create_comp_number
    human_turn
  end

  # create 4 random digits and put into array
  def create_comp_number
    @comp_number = ["", "", "", ""]
    rand_num = Random.new
    @comp_number.each_with_index do |_, index|
      @comp_number[index] = rand_num.rand(1..6)
    end
  end

  def human_turn
    error = false
    # limits amount of guesses made
    while @guesses <= 10
      display_user_info
      insert_into_array(error)
      # error handling (couldn't use continue due to nested loops)
      if error == true
        error = false
        redo
      end
      puts "\n"
      correct = test_input(@input, @comp_number)
      check_correct(correct, @computer_game, @guesses)
      @guesses += 1
    end
    # if user has used up all tries, tell them and prompt to play again
    puts "Oops, you took up all of your 10 guesses? Better luck next time."
    puts "\n"
    game = Main.new
    game.play_again
  end
end

def display_user_info
  puts "This is guess number #{@guesses} out of 10."
  puts "\n"
  puts 'Please enter four numbers between "1" and "6".'
  puts "\n"
end

def insert_into_array(error)
  @input = gets.chomp
  @input = @input.split('')
  if @input.length == 4
    @input.each_with_index do |num, index|
      num = num.to_i
      @input[index] = num
      unless num.between?(1, 6)
        puts 'Error: Characters have been entered that are not between 1 and 6! Please try again.'
        error = true
        break
      end
    end
  else
    puts 'Error: Not four characters entered! Please try again.'
    error = true
  end

  @input
end