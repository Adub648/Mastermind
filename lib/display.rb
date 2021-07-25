module Display
  # information for the user
  def display_info
    <<~HEREDOC

      Welcome to Mastermind! Mastermind is a famous board game strategy game, where it is your aim to guess the code that the computer picks for you in 10 tries or less!

      There are 6 total colors that the computer can choose from, represented in this solution by the numbers 1 to 6.

      When you guess a sequence of 4 numbers, you will receive feedback on how many colors you got in the right position (represented by #{clue_colors("*")}) and how many colors you got right but in the wrong position (represented by #{clue_colors("?")})

      Use this feedback to try to improve upon your guesses, until you (hopefully) get the right answer!

      This game also has the option of you making your own code and letting the computer guess it. The algorithm that I have created should guess the code in 5 or less tries, test it and see if you can try to beat the computers logic skills ;).

      Good luck!

    HEREDOC
  end

  # code to display the numbers
  def clue_colors(clue)
    {
      '*' => "\e[91m\u25CF\e[0m ",
      '?' => "\e[37m\u25CB\e[0m "
    }[clue]
  end
end
