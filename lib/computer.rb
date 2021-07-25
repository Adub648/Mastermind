class Computer
  include GameLogic

  # create initial values
  def initialize
    @human_number = nil
    @computer_game = true
    @guesses = 1
    @colors = [1, 2, 3, 4, 5, 6]
    @all_guesses = @colors.repeated_permutation(4).to_a
  end

  # use functions to begin game
  def start_game
    @possible_guesses = @all_guesses
    create_human_number
    comp_turn
  end

  # ask user for input to create number
  def create_human_number
    puts 'Please enter 4 numbers between "1" and "6" that you would like to be your code.'
    puts "\n"
    input = gets.chomp
    input = input.split('')
    if input.length == 4
      input.each_with_index do |num, index|
        num = num.to_i
        input[index] = num
        unless num.between?(1, 6)
          puts 'Error: Characters have been entered that are not between 1 and 6! Please try again.'
          create_human_number
        end
      end
    else
      puts 'Error: Not four characters entered! Please try again.'
      create_human_number
    end
    # enter number in variable and start computer guesses
    @human_number = input
    puts "\n"
    comp_turn
  end

  def comp_turn
    # limits amount of guesses made
    while @guesses <= 10
      # make this guess as first guess and then check
      if @guesses == 1
        @comp_guess = [1, 1, 2, 2]
        correct = test_input(@comp_guess, @human_number)
      else
        # guess the first avaiable possible guess and then check
        @comp_guess = @possible_guesses[0]
        correct = test_input(@comp_guess, @human_number)
      end

      # create iterant
      i = @possible_guesses.length - 1
      # while that iterant exists
      until i < 0
        send_possibility = @possible_guesses[i]
        # test the guess made against the array of possible guesses
        possible_results = test_input(@comp_guess, send_possibility)
        # if the response isn't the same as to actual answer, delete from array
        unless correct == possible_results
          @possible_guesses.delete_at(i)
        end
        i -= 1
      end

      # output guess, check if correct and iterate
      p @comp_guess
      puts "\n"
      check_correct(correct, @computer_game, @guesses)
      @guesses += 1
      sleep(2)
    end
  end
end
