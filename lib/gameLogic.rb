require_relative 'display'

module GameLogic
  include Display

  # test if input is the number created
  def test_input(input, guessing_number)
    # define initial values
    correct = []
    str = ""
    right_position = 0
    guessing_number = guessing_number.map { |value| value }

    # find all correct numbers in correct position
    input.each_with_index do |num, index|
      if guessing_number[index] == num
        correct[index] = "*"
        guessing_number[index] = nil
        right_position += 1
      end
    end

    # find all correct numbers in wrong position
    input.each_with_index do |num, index|
      if correct[index] == nil && guessing_number.include?(num)
        correct[index] = "?"
      end
    end

    correct
  end

  def check_correct(correct, computer_game, tries)
    # create initial values
    str = ""

    # if all numbers are correct
    if correct == ["*", "*", "*", "*"]
      correct_input(computer_game, tries)
    else
      # create string to show user how many are correct
      correct.each do |val|
        if val == "*"
          str += "#{clue_colors("*")}"
        end
        if val == "?"
          str += "#{clue_colors("?")}"
        end
      end
    end

    puts "Clues: #{str}"
    puts "\n"
  end

  # show correct answer message
  def correct_input(computer_game, tries)
    # if the human played show different message
    if computer_game == false
      puts "Clues: #{clue_colors("*")} #{clue_colors("*")} #{clue_colors("*")} #{clue_colors("*")}"
      puts "\n"
      puts 'That is the correct answer!'
      puts "\n"
      if tries == 1
        puts "You guessed it in 1 try! Congratulations!"
      else
        puts "You guessed it in #{tries} tries. Congratulations!"
        puts "\n"
      end
    # if the computer played show different message
    else
      puts "Clues: #{clue_colors("*")} #{clue_colors("*")} #{clue_colors("*")} #{clue_colors("*")}"
      puts "\n"
      puts 'That is the correct answer!'
      if tries == 1
        puts "The computer guessed it within 1 try! Better luck next time."
        puts "\n"
      else
        puts "The computer guessed it within #{tries} tries! Better luck next time."
        puts "\n"
      end
    end

    # prompt user to play again
    game = Main.new
    game.play_again
  end
end
