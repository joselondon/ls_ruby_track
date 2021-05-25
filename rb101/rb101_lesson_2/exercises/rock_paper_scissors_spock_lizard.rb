

VALID_YES = ['y', 'yes']
VALID_NO = ['n', 'no']
WINING_GAME_SCORE = 5
WELCOME = "***Welcome to Rock, Paper, Scissors, Spock, Lizard***
------------------------------------------------------------
To play:
When prompted, enter one of the following choices:
Rock, Paper, Scissors, Spock, Lizard, and hit return.
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

def check_and_convert_if_abbrev(abbrev)
  if FIRST_LETTER_TO_FULL_WORD_HASH.key?(abbrev)
    FIRST_LETTER_TO_FULL_WORD_HASH[abbrev]
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

def clear_console
  system('clear')
  system('cls')
end

def valid_input?(str)
  if WINNING_MOVES.keys.include?(str.to_s)
    true
  elsif str == 'sp'
    convert_abbr_to_hash_val(str)
    true
  elsif FIRST_LETTER_TO_FULL_WORD_HASH.keys.include?(str.to_s)
    true
  else
    prompt("That's not a valid choice.")
    sleeper()
    clear_console
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

def win?(player_choice)
  WINNING_MOVES[player_choice]
end

def increment_round_by_one(round_counter)
  round_counter + 1
end

def another_game?
  quit = another_game_input_validator()
  quit
end

def player_final_winner?(player, computer)
  player > computer
end

def computer_chooses
  WINNING_MOVES.keys.sample()
end

def start?
  prompt("HIT ANY KEY TO START")
  clear_console if gets()
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

def game_over(score_counter, player_a, player_b)
  (score_counter[player_a] == WINING_GAME_SCORE) ||
    (score_counter[player_b] == WINING_GAME_SCORE)
end

def display_welcome_message
  prompt(WELCOME.to_s)
end

def display_current_round_and_scores(round_counter,
                                     score_counter,
                                     player_a,
                                     player_b)
  prompt("Your score:     #{score_counter[player_a]}")
  prompt("Computer score: #{score_counter[player_b]}")
  prompt("")
  prompt("ROUND:  #{round_counter}")
end

def update_scores(round_counter, score_counter,
                  player_a, player_b)
  prompt("AT ROUND:  #{round_counter}")
  prompt("-------------------")
  prompt("Your score is: #{score_counter[player_a]}")
  prompt("Computer score is: #{score_counter[player_b]}")
  prompt("-------------------")
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

def display_final_result(player, computer)
  if player > computer
    puts "Congratulations, you win the set!"
  else
    puts "Commiserations, computer won the set!"
  end
end

def display_choices(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}")
end

def display_another_game_validation_error
  prompt("Invalid entry.  Please try again")
end

def display_again_message
  prompt("Hit (y)es to play again or (n)o to quit")
end

def display_goodbye
  prompt("Thank you for playing.  Goodbye!")
end

def prompt_for_next_round
  prompt("Enter any key for next round")
  clear_console if gets()
end

def get_player_choice
  choice = ''
  loop do
    prompt("Choose one: (r)ock, (p)aper, (s)cissors,
    (l)izard, (sp)ock")
    choice = gets().chomp().downcase().strip()
    choice = check_and_convert_if_abbrev(choice)
    break if valid_input?(choice)
  end
  choice
end

clear_console()
display_welcome_message()
prompt("")
start?()

loop do
  player_choice = ''
  loop do
      display_current_round_and_scores(round, scores,
                                       :player_score,
                                       :computer_score)
      #choice = get_player_choice()
      #choice = check_and_convert_if_abbrev(choice)
      #break if valid_input?(choice)
    player_choice = get_player_choice()
    computer_choice = computer_chooses()

    display_choices(player_choice, computer_choice)
    display_results(player_choice, computer_choice)
    assign_score(player_choice, computer_choice, scores)

    update_scores(round, scores, :player_score, :computer_score)
    break if game_over(scores, :player_score, :computer_score)
    prompt_for_next_round()
    increment_round_by_one(round)
  end

  display_final_result(scores[:player_score], scores[:computer_score])
  another_game?() ? sleeper : break
  clear_console()
  clear_scores(scores, :player_score,
               :computer_score)
  next
end

display_goodbye()
