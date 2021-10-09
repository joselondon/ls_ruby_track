require 'pry-byebug'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
PLAYER_OPTIONS = ['human', 'computer']
VALID_YES = "yes" || "y"
VALID_NO = "no" || "n"

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts " #{brd[1]}   |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[4]}   |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[7]}   |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def display_welcome_text
  system 'clear'
  puts "Welcome to Tic Tac Toe"
  puts "RULES"
  puts "When prompted place your player piece ('X'), the computer will"
  puts "then move.  First player to get 3 in a row"
  puts "(vertical, horizonal or diaganol, wins the game."
  puts "First person to win 5 games wins the tournament!"
  puts
  display_board_numbers
end

def display_board_numbers
  puts "Board spaces are numbered as follows: - "
  puts "1 | 2 | 3"
  puts "4 | 5 | 6"
  puts "7 | 8 | 9"
end

def break_out_of_welcome?
  prompt "Hit enter to continue to the game tournament"
  go_to_game = gets.chomp
  !go_to_game.nil?
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def display_human_start
  puts "Human starts..."
  sleep(2)
  PLAYER_OPTIONS[0]
end

def display_ai_start
  puts "Computer starts..."
  sleep(2)
  PLAYER_OPTIONS[1]
end

def ai_chooses_start
  ai_choice = PLAYER_OPTIONS.sample
  puts "Computer chooses #{ai_choice} to go first"
  sleep(2)
  ai_choice
end

def choose_starting_player
  prompt "Enter 'h', or 'c' for either the human or computer player to start"
  prompt "or hit any other key to let ai decide"
  first_player = gets.chomp.downcase
  if first_player.start_with?('h')
    display_human_start
  elsif first_player.start_with?('c')
    display_ai_start
  else
    ai_chooses_start
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    square = gets.chomp
    break if empty_squares(brd).include?(square.to_i) &&
             !square.include?('.')
    prompt("Sorry, that's not a valid choice. ")
  end
  brd[square.to_i] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  elsif computer_opportunity?(brd)
    computer_exploits(brd)
  elsif player_threat?(brd)
    computer_defends!(brd)
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def player_threat?(brd)
  threat = false
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) >= 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) > 0
      threat = true
      break
    end
  end
  threat
end

def computer_opportunity?(brd)
  opportunity = false
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) >= 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) > 0
      opportunity = true
      break
    end
  end
  opportunity
end

def computer_exploits(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) >= 2
      line.each do |key|
        brd[key] = COMPUTER_MARKER if brd[key] == INITIAL_MARKER
      end
    end
  end
end

def computer_defends!(brd)
  plays = 0
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) >= 2
      line.each do |key|
        if brd[key] == INITIAL_MARKER
          brd[key] = COMPUTER_MARKER
          plays += 1
        end
        break if plays > 0
      end
    end
  end
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).all?(PLAYER_MARKER)
      return 'Player'
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return 'Computer'
    end
  end
  nil
end

def tournament_winner?(play, comp)
  if play == 5 || comp == 5
    true
  else
    false
  end
end

def champion(play)
  play == 5 ? 'Player ' : 'Computer '
end

def place_piece!(brd, player)
  if player == 'human'
    player_places_piece!(brd)
  elsif player == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'human'
    current_player = 'computer'
  elsif current_player == 'computer'
    current_player = 'human'
  end
  current_player
end

def display_scores(rnd, human_score, ai_score)
  puts "Round #{rnd}"
  puts "Player score: #{human_score}"
  puts "Computer score: #{ai_score}"
  puts
end

loop do
  display_welcome_text
  break_out_of_welcome?

  player_score = 5
  computer_score = 0
  round = 1

  loop do
    board = initialize_board
    system 'clear'
    display_scores(round, player_score, computer_score)
    current_player = choose_starting_player
    loop do
      display_board(board)
      display_scores(round, player_score, computer_score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
    display_board(board)
    if someone_won?(board)
      prompt("#{detect_winner(board)} won!")
    else
      prompt("Its a tie!")
    end

    if detect_winner(board) == 'Player'
      player_score += 1
    elsif detect_winner(board) == 'Computer'
      computer_score += 1
    end
    round += 1
    sleep(3)

    if tournament_winner?(player_score, computer_score)
      puts "============================================"
      prompt "#{champion(player_score)} wins the tournament!"
      puts
      break
    end
  end

  response = ''
  loop do
    prompt "Play again?"
    response = gets.chomp.downcase
    if response == 'n' || response == 'no' || response == 'y' || response == 'yes'
      break
    else 
      prompt "Invalid answer, try again."
    end
  end

  break if response == 'n' || response == 'no'

  # prompt("Play again? (y or n)")
  # answer = gets.chomp.downcase
  # break unless answer.downcase.start_with?('y')
end
system 'clear'
prompt("Thanks for playing tic tac toe.  Goodbye!")
