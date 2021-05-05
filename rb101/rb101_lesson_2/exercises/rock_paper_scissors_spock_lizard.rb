require 'pry'
VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
VALID_CHOICES_ABBR = ['r', 'p', 's', 'l']
WINING_GAME_SCORE = 5

def prompt(message)
  Kernel.puts(">> #{message}")
end

PLAYER_WIN = {
  rock:
  {
    rock: 'tie',
    scissors: true,
    lizard: true
  },
  paper:
  {
    paper: 'tie',
    spock: true,
    rock: true
  },
  scissors:
  {
    paper: true,
    scissors: 'tie',
    lizard: true
  },
  spock:
  {
    rock: true,
    scissors: true,
    spock: 'tie'
  },
  lizard:
  {
    paper: true,
    spock: true,
    lizard: 'tie'
  }
}

FIRST_LETTER_TO_FULL_WORD_HASH = {
  r: :rock,
  p: :paper,
  s: :scissors,
  sp: :spock,
  l: :lizard
}

def convert_abbr_to_hash_val(abbrev)
  FIRST_LETTER_TO_FULL_WORD_HASH.each do |key, _|
    if abbrev.to_sym == key
      abbrev = FIRST_LETTER_TO_FULL_WORD_HASH[abbrev]
      return abbrev
    end
  end
end

def valid_input?(str)
  if VALID_CHOICES.include?(str.to_s)
    true
  elsif str == :sp
    convert_abbr_to_hash_val(str)
    true
  elsif VALID_CHOICES_ABBR.include?(str.to_s)
    true
  else
    prompt("That's not a valid choice.")
    sleep(1)
    prompt("|")
    sleep(1)
    prompt("|")
    sleep(1)
    prompt("|")
    sleep(1)
    clear_console
  end
end

def win?(first, second)
  PLAYER_WIN[first][second]
end

def display_results(player, computer)
  if win?(player, computer) == 'tie'
    puts "its a tie"
  elsif win?(player, computer)
    puts "you win"
  else
    puts "you lose"
  end
end

def player_final_winner?(player, computer)
  player > computer
end

def display_final_result(player, computer)
  if player > computer
    puts "Congratulations, you win the set!"
  else
    puts "Commiserations, computer won the set!"
  end
end

def clear_console
  system('clear')
  system('cls')
end

loop do
  player_score = 0
  computer_score = 0
  round = 1

  loop do
    choice = ''
    loop do
      prompt("Your score:     #{player_score}")
      prompt("Computer score: #{computer_score}")
      prompt("")
      prompt("ROUND:  #{round}")
      prompt("   Choose one: #{VALID_CHOICES.join(', ')},
      you can just type the first letter (or 'sp' for 'spock')")

      choice = Kernel.gets().chomp().to_sym
      break if valid_input?(choice)
    end

    if FIRST_LETTER_TO_FULL_WORD_HASH.key?(choice)
      choice = FIRST_LETTER_TO_FULL_WORD_HASH[choice]
    end
    computer_choice = VALID_CHOICES.sample().to_sym

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
    display_results(choice, computer_choice)

    if win?(choice, computer_choice) == 'tie'
      player_score += 0
    elsif win?(choice, computer_choice)
      player_score += 1
    else
      computer_score += 1
    end

    prompt("AT ROUND:  #{round}")
    prompt("-------------------")
    prompt("Your score is: #{player_score}")
    prompt("Computer score is: #{computer_score}")
    prompt("-------------------")
    break if (player_score == WINING_GAME_SCORE) || 
      (computer_score == WINING_GAME_SCORE)
    prompt("Enter any key for next round")
    clear_console if gets()

    round += 1
  end

  display_final_result(player_score, computer_score)
  prompt('Do you want to play again?')
  answer = Kernel.gets().downcase().chomp()
  break unless answer.start_with?('y')
  clear_console
end

prompt("Thank you for playing.  Goodbye!")
