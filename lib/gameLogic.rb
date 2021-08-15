require_relative 'display'

module GameLogic
  include Display

  # test if input is the number created
  def test_input(input, guessing_number)
    correct = []
    guessing_number = guessing_number.map { |value| value }
    correct_pos(guessing_number, input, correct)
    wrong_pos(guessing_number, input, correct)
    correct
  end

  def correct_pos(guessing_number, input, correct)
    right_position = 0
    # add correct position to index
    input.each_with_index do |num, index|
      if guessing_number[index] == num
        correct[index] = "*"
        guessing_number[index] = nil
        right_position += 1
      end
    end
  end

  def wrong_pos(guessing_number, input, correct)
    # add wrong position to index
    input.each_with_index do |num, index|
      if correct[index] == nil && guessing_number.include?(num)
        correct[index] = "?"
      end
    end
  end

  def check_correct(correct, computer_game, tries)
    @str = ''
    # if all numbers are correct
    if correct == ["*", "*", "*", "*"]
      correct_input(computer_game, tries)
    else
      correct_to_array(correct)
    end
    puts "Clues: #{@str}"
    puts "\n"
  end

  def correct_to_array(correct)
    correct.each do |val|
      if val == "*"
        @str += "#{clue_colors("*")}"
      end
      if val == "?"
        @str += "#{clue_colors("?")}"
      end
    end
  end

  def correct_input(computer_game, tries)
    if computer_game == false
      human_message(tries)
    else
      computer_message(tries)
    end
    game = Main.new
    game.play_again
  end

  def human_message(tries)
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
  end

  def computer_message(tries)
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

end
