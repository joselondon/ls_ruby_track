require 'pry'
VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
VALID_CHOICES_ABBR = ['r', 'p', 's', 'l']
VALID_YES = ['y', 'yes']
VALID_NO = ['n', 'no']
WINING_GAME_SCORE = 5
WELCOME = "***Welcome to Rock, Paper, Scissors, Spock, Lizard***
------------------------------------------------------------
To play:  
When prompted, enter one of the following choices: 
#{VALID_CHOICES.join(' , ')} , and hit return.   
The compluter's choice will be displayed along with the 
winner or a tied result. The first player to reach a score
of #{WINING_GAME_SCORE} wins!

WINNING COMBINATIONS ARE:-
Scissors decapitate lizard, Scissors cuts paper, paper covers rock,
rock crushes lizard, lizard poisons Spock, Spock smashes scissors,
scissors decapitates lizard, lizard eats paper, paper disproves Spock,
Spock vaporizes rock, and as it always has, rock crushes scissors."

def prompt(message)
  Kernel.puts(">> #{message}")
end

WINNING_MOVES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
 }

FIRST_LETTER_TO_FULL_WORD_HASH = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

scores = {
  player_score: 4,
  computer_score: 4
}

round = 1

def convert_abbr_to_hash_val(abbrev)
  FIRST_LETTER_TO_FULL_WORD_HASH.each do |key, _|
    if abbrev == key
      abbrev = FIRST_LETTER_TO_FULL_WORD_HASH[abbrev]
      return abbrev
    end
  end
end

def check_and_convert_if_abbrev(abbrev)
  if FIRST_LETTER_TO_FULL_WORD_HASH.key?(abbrev)
    abbrev = FIRST_LETTER_TO_FULL_WORD_HASH[abbrev]
  else
    abbrev
  end
end

def sleeper
  sleep(1)
  prompt("|")
  sleep(1)
  prompt("|")
  sleep(1)
  prompt("|")
  sleep(1)
end

def clear_scores(score_tab, player_a, player_b)
  score_tab[player_a] = 0
  score_tab[player_b] = 0
end

def player_chooses_and_validate_choice(input,
                                       score_counter,
                                       round_counter)
  loop do
  input = player_chooses(score_counter, round_counter)
  break if valid_input?(input)
  end
  input
end

def valid_input?(str)
  if VALID_CHOICES.include?(str.to_s)
    true
  elsif str == 'sp'
    convert_abbr_to_hash_val(str)
    true
  elsif VALID_CHOICES_ABBR.include?(str.to_s)
    true
  else
    prompt("That's not a valid choice.")
    sleeper()
    clear_console
  end
end

def win?(player_choice)
  WINNING_MOVES[player_choice]
end

def display_welcome_message
  prompt("#{WELCOME}")
end

def player_chooses(score_counter, round_counter)
  prompt("Your score:     #{score_counter[:player_score]}")
  prompt("Computer score: #{score_counter[:computer_score]}")
  prompt("")
  prompt("ROUND:  #{round_counter}")
  prompt("Choose one: (r)ock, (p)aper, (s)cissors,         
  (l)izard, (sp)ock")
  gets().chomp().downcase().strip()
end

def computer_chooses
  VALID_CHOICES.sample()
end

def start?
  prompt("HIT ANY KEY TO START")
  clear_console if gets()
end

def display_results(player, computer)
  if player == computer
    puts "its a tie"
  elsif WINNING_MOVES[player].include?(computer)
    puts "you win"
  else
    puts "you lose"
  end
end

def player_final_winner?(player, computer)
  player > computer
end

def display_choices(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}")
end

def display_final_result(player, computer)
  if player > computer
    puts "Congratulations, you win the set!"
  else
    puts "Commiserations, computer won the set!"
  end
end

def valid_quit_options(input)
  if VALID_YES.include?(input) || VALID_NO.include?(input)
    true
  else
    false
  end
end

def another_game_input_validator
  input = ''
  display_again_message()
  loop do
    input = gets().chomp().downcase().strip()
    if valid_quit_options(input) 
      break
    else
      display_another_game_validation_error()
    end
  end
  VALID_YES.include?(input) ? true : false
end

def update_scores(round_counter, score_counter,
                  player_a, player_b)
  prompt("AT ROUND:  #{round_counter}")
  prompt("-------------------")
  prompt("Your score is: #{score_counter[player_a]}")
  prompt("Computer score is: #{score_counter[player_b]}")
  prompt("-------------------") 
end

def game_over(score_counter, player_a, player_b)
  (score_counter[player_a] == WINING_GAME_SCORE) ||
  (score_counter[player_b] == WINING_GAME_SCORE)
end

def another_game?
  quit = another_game_input_validator()
  return quit
end

def clear_console
  system('clear')
  system('cls')
end

def display_again_message
  prompt("Hit (y)es to play again or (n)o to quit")
end

def display_another_game_validation_error
  prompt("Invalid entry.  Please try again")
end

def assign_score(player, computer, score_counter)
  if player == computer
    score_counter[:player_score] += 0
  elsif WINNING_MOVES[player].include?(computer)
    score_counter[:player_score] += 1
  else
    score_counter[:computer_score] += 1
  end
end

clear_console()
display_welcome_message()
prompt("")
start?()

loop do
  choice = ''
  loop do
    choice = player_chooses_and_validate_choice(choice,
                                                scores,
                                                round)
    choice = check_and_convert_if_abbrev(choice)
    computer_choice = computer_chooses()

    display_choices(choice, computer_choice)
    display_results(choice, computer_choice)
    assign_score(choice, computer_choice, scores)

    update_scores(round, scores, :player_score, :computer_score)
    break if game_over(scores, :player_score, :computer_score)
    prompt("Enter any key for next round")
    clear_console if gets()

    round += 1
  end

  display_final_result(scores[:player_score], scores[:computer_score])
  another_game?() ? sleeper : break
  clear_console()
  clear_scores(scores, :player_score,
    :computer_score)
  next
end

prompt("Thank you for playing.  Goodbye!")
