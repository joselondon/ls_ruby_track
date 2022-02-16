VALID_HIT = ['hit', 'h']
VALID_STAY = ['stay', 's']
COURTS_CARDS = ["Jack", "Queen", "King"]
MAX_VALID_SCORE = 21
DEALER_AUTO_STAY_SCORE = 17
STAND_TIMER = 2
VALID_YES = ['y', 'yes']
RANKS = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
SUITS = %w(Spades Hearts Diamonds Clubs)
WINNING_MATCH_SCORE = 5

def prompt(message)
  puts "=> #{message}"
end

def display_welcome
  system 'clear'
  <<-WELCOME
  *** Welcome to Twenty One ***
  Objective is to reach a score as close to #{MAX_VALID_SCORE}
  without exceeding 21.
  Pip cards are worth their face value, and court card all worth 10.
  Aces are worth 1 or 11 whichever score does the best job of keeping
  your score under #{MAX_VALID_SCORE}.
  Player goes first selecting 'hit' to draw another card or 'stay'
  to halt for dealer's turn. If either player exceeeds #{MAX_VALID_SCORE} they
  bust and lose the game. Dealer's turn proceeds in a similar way however
  the  dealer automatically stays at #{DEALER_AUTO_STAY_SCORE}.
  First player to win #{WINNING_MATCH_SCORE} games, wins the match!
  Good luck!!!
  WELCOME
end

def hit_key_to_start
  puts "Hit <ENTER> to continue."
  gets
  system 'clear'
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    RANKS.size.times do |i|
      value = if RANKS[i] == 'Ace'
                0
              elsif RANKS[i].to_i == 0
                10
              else
                RANKS[i].to_i
              end
      deck << { suit: suit, rank: RANKS[i], value: value }
    end
  end
  deck
end

def deal_card(deck)
  card = deck.sample
  deck.slice!(deck.index(card))
end

def initial_deal(deck, hand)
  2.times { hand << deal_card(deck) }
end

def have?(player)
  if player.downcase == :player
    'You have: '
  elsif player.downcase == :dealer

    'Dealer has: '
  else
    '[INVALID] has/have: '
  end
end

def display_hand_value?(hand, card, player_id, hide)
  (card == hand.last && player_id == :player) || (card == hand.last &&
   player_id == :dealer && hide == false)
end

def display_and?(hand, card)
  card == hand.last
end

def hidden_dealer_card_logic(player_id, hand, card, hide)
  card == hand.first && player_id == :dealer &&
    hide == true
end

def print_hand_value(hand, card)
  puts "and #{card[:rank]} #{card[:suit]}. Val: #{calc_hand(hand)}"
end

def print_and(card)
  puts "and #{card[:rank]} #{card[:suit]}."
end

def print_card(card)
  print "#{card[:rank]} #{card[:suit]},"
end

def display_hand(player_id, hand, hide = true)
  print have?(player_id).to_s
  hand.each do |card|
    if display_hand_value?(hand, card, player_id, hide)
      print_hand_value(hand, card)
    elsif display_and?(hand, card)
      print_and(card)
    elsif hidden_dealer_card_logic(player_id, hand, card, hide)
      print "[HIDDEN] "
    else
      print_card(card)
    end
  end
end

def display_hands(data, hide)
  system 'clear'
  display_hand(:dealer, data[:dealer][:hand], hide)
  display_hand(:player, data[:player][:hand])
end

def ask_player_hit_or_stay?
  prompt "Hit or stay?"
  choice = ''
  loop do
    choice = gets.chomp.downcase
    break if valid_choice?(choice)
    prompt "Please enter either '(h)it' or '(s)tay'"
  end
  choice
end

def valid_choice?(choice)
  VALID_HIT.include?(choice) || VALID_STAY.include?(choice)
end

def update_hand(hand, deck, player_id)
  card = deal_card(deck)
  hand << card
  puts "#{player_id} dealt:  #{card[:rank]} of #{card[:suit]}"
end

def calc_hand_excl_aces(hand)
  sum = 0
  hand.each do |card|
    sum += card[:value]
  end
  sum
end

def calc_aces(hand)
  aces_left = hand.count { |card| card[:rank] }
  aces_value = 0
  until aces_left <= 0
    hand.each do |card|
      if card[:rank] == "Ace"
        aces_value += calc_hand_excl_aces(hand) + aces_value > 10 ? 1 : 11
      end
      aces_left -= 1
    end
  end
  aces_value
end

def calc_hand(hand)
  calc_hand_excl_aces(hand) + calc_aces(hand)
end

def busted?(scores_data, player_id)
  scores_data[player_id][:score] > MAX_VALID_SCORE
end

def disply_plyr_bust
  "You are busted!  Dealer Wins"
end

def disply_deal_bust
  "Dealer is bust! Player Wins!"
end

def gen_display_busted(player_id, data, winner)
  system 'clear'
  display_hand(:dealer, data[:dealer][:hand], false)
  display_hand(:player, data[:player][:hand])
  puts player_id == 'Player' ? disply_plyr_bust : disply_deal_bust
  winner << player_id
end

def dealers_choice?(dealers_hand)
  if calc_hand(dealers_hand) >= DEALER_AUTO_STAY_SCORE
    'stay'
  else
    'hit'
  end
end

def choose_hit_or_stay(data)
  display_hands(data, true)
  ask_player_hit_or_stay?
end

def player_turn(data, deck, winner, match_tracker)
  loop do
    system 'clear'
    if VALID_STAY.include?(choose_hit_or_stay(data))
      break
    else
      update_hand(data[:player][:hand], deck, :player)
      update_score(data, :player)
      hit_key_to_start
    end
    if busted?(data, :player)
      gen_display_busted('Player', data, winner)
      match_tracker[:dealer] += 1
      break
    end
  end
end

def print_dealer_chooses_to_day
  puts "Dealer chooses to stay"
  hit_key_to_start
end

def dealer_turn(data, deck, match_tracker, winner)
  loop do
    display_hands(data, false)
    if busted?(data, :dealer)
      gen_display_busted(:dealer, data, winner)
      match_tracker[:player] += 1
      break
    elsif dealers_choice?(data[:dealer][:hand]) == 'stay'
      print_dealer_chooses_to_day
      break
    else
      update_hand(data[:dealer][:hand], deck, :dealer)
      update_score(data, :dealer)
      sleep(STAND_TIMER)
    end
  end
end

def update_score(data, player_id)
  data[player_id][:score] = calc_hand(data[player_id][:hand])
end

def calc_winner(data)
  if data[:player][:score] > data[:dealer][:score]
    :player
  elsif data[:player][:score] < data[:dealer][:score]
    :dealer
  else
    'draw'
  end
end

def display_winner(winner, data)
  puts "Player hand value: #{data[:player][:score]}"
  puts "Dealer hand value: #{data[:dealer][:score]}"
  puts
  puts "Winner is: #{winner}"
end

def play_again?
  prompt "Enter '(y)es' to play again, or any other key to exit"
  response = gets.chomp.downcase
  VALID_YES.include?(response)
end

def display_match_scores(match_tracker, dlr_id, plr_id)
  puts "Player score:  #{match_tracker[plr_id]}"
  puts "Dealer score:  #{match_tracker[dlr_id]}"
  hit_key_to_start
end

def end_game(data, match_tracker)
  system 'clear'
  display_hand(:dealer, data[:dealer][:hand], false)
  display_hand(:player, data[:player][:hand], false)
  puts
  update_score(data, :dealer)
  update_score(data, :player)
  winner = calc_winner(data)
  match_tracker[winner] += 1 if winner != 'draw'
  display_winner(winner, data)
end

def match_winner?(match_tracker, plr_id, dlr_id)
  match_tracker[plr_id] == WINNING_MATCH_SCORE ||
    match_tracker[dlr_id] == WINNING_MATCH_SCORE
end

def calc_match_winner(match_tracker)
  match_tracker.key(match_tracker.values.max).capitalize
end

def goodbye
  sleep(STAND_TIMER)
  system 'clear'
  puts "Thanks for playing Twenty One.  Goodbye!"
end

# main game loop
puts display_welcome
hit_key_to_start

loop do
  games_score_tracker = { dealer: 0,
                          player: 0 }
  loop do
    game_data = { player: { hand: [],
                            score: 0,
                            id: :player },
                  dealer: { hand: [],
                            score: 0,
                            id: :dealer } }
    deck = initialize_deck
    winner = []
    initial_deal(deck, game_data[:player][:hand])
    initial_deal(deck, game_data[:dealer][:hand])
    player_turn(game_data, deck, winner, games_score_tracker)
    if winner.empty?
      dealer_turn(game_data, deck, games_score_tracker, winner)
    end
    if winner.empty?
      end_game(game_data, games_score_tracker)
    end
    sleep(STAND_TIMER)
    if match_winner?(games_score_tracker, :player, :dealer)
      display_match_scores(games_score_tracker, :dealer, :player)
      puts "#{calc_match_winner(games_score_tracker)} is the match-winner"
      break
    end
    display_match_scores(games_score_tracker, :dealer, :player)\
  end
  break unless play_again?
end
goodbye
