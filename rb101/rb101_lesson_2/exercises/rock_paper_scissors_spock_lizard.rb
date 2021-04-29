require 'pry'
VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
VALID_CHOICES_ABBR = ['r', 'p', 's', 'l']

def prompt(message)
  Kernel.puts(">> #{message}")
end

PLAYER_MOVE_LOGIC = {
  rock:
  {
    rock: 'tie',
    paper:  false,
    scissors: true,
    spock:  false,
    lizard: true
  },
  paper:
  {
    rock: true,
    paper:  'tie',
    scissors: false,
    spock:  true,
    lizard: false
  },
  scissors:
  {
    rock: false,
    paper:  true,
    scissors: 'tie',
    spock:  false,
    lizard: true
  },
  spock:
  {
    rock: true,
    paper:  false,
    scissors: true,
    spock:  'tie',
    lizard: false
  },
  lizard:
  {
    rock: false,
    paper:  true,
    scissors: false,
    spock:  true,
    lizard: 'tie'
  }
}

FIRST_LETTER_TO_FULL_WORD_HASH = {
  r:  :rock,
  p:  :paper,
  s:  :scissors,
  sp: :spock,
  l:  :lizard
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
  end
end


def win?(first, second)
  PLAYER_MOVE_LOGIC[first][second]
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
  if player > computer
    return true
  else 
    return false
  end
end

def display_final_result(player, computer)
  if player > computer
    puts "Congratulations, you win the set!"
  else
    puts "Commiserations, computer won the set!"
  end
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
      prompt("Choose one: #{VALID_CHOICES.join(', ')}, 
      you can just type the first letter (or 'sp' for 'spock')")

      choice = Kernel.gets().chomp().to_sym
      break if valid_input?(choice)
    end

    choice = FIRST_LETTER_TO_FULL_WORD_HASH[choice] if FIRST_LETTER_TO_FULL_WORD_HASH.has_key?(choice) 
    computer_choice = VALID_CHOICES.sample().to_sym


    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
    display_results(choice, computer_choice)

    if win?(choice, computer_choice) == 'tie'
      player_score += 0
    elsif win?(choice, computer_choice) 
      player_score += 1
    elsif win?(choice, computer_choice) == false
      computer_score += 1
    end

    prompt("At round #{round}")
    prompt("Your score is: #{player_score}")
    prompt("Computer score is: #{computer_score}")
    prompt("-------------------")
    break if (player_score == 5) || (computer_score == 5) 
    prompt("Hit any key for next round")
    system("clear") if gets() 

    round += 1
  end

    display_final_result(player_score, computer_score)
    prompt('Do you want to play again?')
    answer = Kernel.gets().downcase().chomp()
    break unless answer.start_with?('y')
    system("clear")
end

prompt("Thank you for playing.  Goodbye!")
