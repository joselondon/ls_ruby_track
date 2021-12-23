require 'pry-byebug'
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

def initialize_deck
  deck = []
  SUITS.each do |suit|
    RANKS.size.times do |i|
      deck << [RANKS[i], suit]
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

def display_hand(player_id, hand, hide = true)
  print have?(player_id).to_s
  hand.each do |card|
    if display_hand_value?(hand, card, player_id, hide)
      puts "and #{card[0]}.  Hand value = #{calc_hand(hand)}"
    elsif display_and?(hand, card)
      puts "and #{card[0]}."
    elsif hidden_dealer_card_logic(player_id, hand, card, hide)
      print "[HIDDEN] "
    else
      print "#{card[0]}, "
    end
  end
end

def display_hands(plr_id, dlr_id, plr_hnd, dlr_hnd, hide)
  system 'clear'
  display_hand(dlr_id, dlr_hnd, hide)
  display_hand(plr_id, plr_hnd)
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
  puts "#{player_id} dealt:  #{card[0]} of #{card[1]}"
end

def calc_ace(hand)
  flattened = hand.flatten
  aces_left = flattened.count("Ace")
  aces_value = 0
  until aces_left <= 0
    flattened.each do |card|
      if card == "Ace"
        aces_value += calc_hand_excl_aces(hand) + aces_value > 10 ? 1 : 11
      end
      aces_left -= 1
    end
  end
  aces_value
end

def calc_sum_of_pip_cards(hand)
  hand.flatten.map(&:to_i).sum
end

def calc_sum_of_court_cards(hand)
  value = 0
  hand.flatten.map do |e|
    if COURTS_CARDS.include?(e)
      value += 10
    elsif e == "Ace"
      0
    end
  end
  value
end

def calc_hand_excl_aces(hand)
  value_of_pips = calc_sum_of_pip_cards(hand)
  value_of_courts = calc_sum_of_court_cards(hand)
  value_of_courts + value_of_pips
end

def calc_hand(hand)
  calc_hand_excl_aces(hand) + calc_ace(hand)
end

def busted?(scores_hash, player_id)
  scores_hash[player_id] > MAX_VALID_SCORE
end

def disply_plyr_bust
  "You are busted!  Dealer Wins"
end

def disply_deal_bust
  "Dealer is bust! Player Wins!"
end

def gen_display_busted(player_id, player_hand, dealer_hand, winner, hide)
  system 'clear'
  display_hand(:dealer, dealer_hand, hide)
  display_hand(:player, player_hand)
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

# rubocop:disable Metrics/MethodLength: Method has too many lines
# rubocop:disable Metrics/ParameterLists: Avoid parameter lists longer than 5 parameters
def player_turn(dealer_hand, player_hand, deck,
                winner, scores_hash, player_id, dealer_id, match_tracker)
  loop do
    display_hands(player_id, dealer_id, player_hand, dealer_hand, true)
    choice = ask_player_hit_or_stay?
    sleep(0.5)
    system 'clear'
    if VALID_STAY.include?(choice)
      break
    else
      update_hand(player_hand, deck, player_id)
      scores_hash[player_id] = calc_hand(player_hand)
      sleep(STAND_TIMER)
    end
    if busted?(scores_hash, player_id)
      gen_display_busted('Player', player_hand, dealer_hand, winner, false)
      match_tracker[dealer_id] += 1
      break
    end
  end
end

def dealer_turn(dealer_hand, player_hand, deck, winner,
                scores_hash, player_id, dealer_id, match_tracker)
  loop do
    display_hands(player_id, dealer_id, player_hand, dealer_hand, false)
    puts
    if busted?(scores_hash, player_id)
      gen_display_busted(dealer_id, player_hand, dealer_hand, winner, false)
      match_tracker[player_id] += 1
      break
    elsif dealers_choice?(dealer_hand) == 'stay'
      puts "Dealer chooses to stay"
      sleep(STAND_TIMER)
      break
    else
      update_hand(dealer_hand, deck, dealer_id)
      scores_hash[player_id] = calc_hand(dealer_hand)
      sleep(STAND_TIMER)
    end
  end
end
# rubocop:enable Metrics/MethodLength: Method has too many lines
# rubocop:enable Metrics/ParameterLists: Avoid parameter lists longer than 5 parameters

def update_score(hand, scores_hash, player_id)
  scores_hash[player_id] = calc_hand(hand)
end

def calc_winner(scores_hash)
  if scores_hash[:player] > scores_hash[:dealer]
    :player
  elsif scores_hash[:player] < scores_hash[:dealer]
    :dealer
  else
    'draw'
  end
end

def display_winner(winner, scores_hash)
  puts "Player hand value: #{scores_hash[:player]}"
  puts "Dealer hand value: #{scores_hash[:dealer]}"
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
  sleep(STAND_TIMER + 3)
end

# rubocop:disable Metrics/ParameterLists: Avoid parameter lists longer than 5 parameters
def end_game(dealer_hand, player_hand, scores_hash, player_id, dealer_id,
             match_tracker)
  system 'clear'
  display_hand(dealer_id, dealer_hand, false)
  display_hand(player_id, player_hand, false)
  puts
  update_score(dealer_hand, scores_hash, dealer_id)
  update_score(player_hand, scores_hash, player_id)
  winner = calc_winner(scores_hash)
  match_tracker[winner] += 1 if winner != 'draw'
  display_winner(winner, scores_hash)
end
# rubocop:enable Metrics/ParameterLists: Avoid parameter lists longer than 5 parameters

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
loop do
  games_score_tracker = { dealer: 0,
                          player: 0 }
  loop do
    scores = { dealer: 0,
               player: 0 }
    deck = initialize_deck
    player_hand = []
    dealer_hand = []
    winner = []
    initial_deal(deck, player_hand)
    initial_deal(deck, dealer_hand)
    player_turn(dealer_hand, player_hand, deck, winner, scores, :player,
                :dealer, games_score_tracker)
    if winner.empty?
      dealer_turn(dealer_hand, player_hand, deck, winner, scores,
                  :player, :dealer, games_score_tracker)
    end
    if winner.empty?
      end_game(dealer_hand, player_hand, scores,
               :player, :dealer, games_score_tracker)
    end
    sleep(STAND_TIMER + 2)

    if match_winner?(games_score_tracker, :player, :dealer)
      display_match_scores(games_score_tracker, :dealer, :player)
      puts "#{calc_match_winner(games_score_tracker)} is the match-winner"
      break
    end
    display_match_scores(games_score_tracker, :dealer, :player)\
  end
  break if play_again? == false
end
goodbye
