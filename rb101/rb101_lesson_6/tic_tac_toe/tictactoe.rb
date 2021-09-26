require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def choose_starting_player
  prompt "Enter 'c' for computer to start, or any other key for human to start"
  first_player = gets.chomp.downcase
  if first_player.start_with?('h')
    return true
  else
    return false
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice. ")
  end
  brd[square] = PLAYER_MARKER
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
    if (brd.values_at(*line).count(PLAYER_MARKER) >= 2) && (brd.values_at(*line).count(INITIAL_MARKER) > 0)
      threat = true
      break
    end
  end
  threat
end

def computer_opportunity?(brd)
  opportunity = false
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(COMPUTER_MARKER) >= 2) && (brd.values_at(*line).count(INITIAL_MARKER) > 0)
      opportunity = true
      break
    end
  end
  opportunity
end

def computer_exploits(brd)
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(COMPUTER_MARKER) >= 2)
      line.each do |key|
        brd[key] = COMPUTER_MARKER if brd[key] == INITIAL_MARKER
      end
    end
  end
end

def computer_defends!(brd) 
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(PLAYER_MARKER) >= 2)
      line.each do |key|
        brd[key] = COMPUTER_MARKER if brd[key] == INITIAL_MARKER
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

def tournament_winner?(play,comp)
  if play == 5 || comp == 5
    return true
  else
    false
  end
end

def champion(play, comp)
  play == 5 ? 'Player '  : 'Computer '
end

loop do
  player_score = 0
  computer_score = 0
  round = 1
  

  loop do
    board = initialize_board
    system 'clear'
    player_starts = choose_starting_player
    loop do
      display_board(board)
      puts "Round #{round}"
      puts "Player score: #{player_score}"
      puts "Computer score: #{computer_score}"
      puts
      if player_starts == true
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      elsif player_starts == false
        computer_places_piece!(board)
        display_board(board)
        break if someone_won?(board) || board_full?(board)
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end
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
      prompt "#{champion(player_score, computer_score)} wins the tournament!" 
      puts
      break
    end
  end
  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing tic tac toe.  Goodbye!")
