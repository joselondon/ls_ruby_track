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

def have?(player_id)
  if player_id == :player
    'You have: '
  elsif player_id == :dealer
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

def hidden_dealer_card_logic(player_str, hand, card, hide)
  card == hand.first && player_str.downcase == 'dealer' &&
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

def update_hand(hand, deck, player_string)
  card = deal_card(deck)
  hand << card
  puts "#{player_string} dealt:  #{card[0]} of #{card[1]}"
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

def gen_display_busted(player_str, player_hand, dealer_hand, hide, winner)
  system 'clear'
  display_hand(:dealer, dealer_hand, hide)
  display_hand(:player, player_hand)
  puts player_str == 'Player' ? disply_plyr_bust : disply_deal_bust
  winner << player_str
end

# rubocop:disable Metrics/MethodLength: Method has too many lines
def player_turn(dealer_hand, player_hand, deck, winner, scores_hash, player_id)
  loop do
    display_hands(:player, :dealer, player_hand, dealer_hand, true)
    choice = ask_player_hit_or_stay?
    sleep(0.5)
    system 'clear'
    if VALID_STAY.include?(choice)
      break
    else
      update_hand(player_hand, deck, :player)
      scores_hash[player_id] = calc_hand(player_hand)
      sleep(STAND_TIMER)
    end
    if busted?(scores_hash, player_id)
      gen_display_busted('Player', player_hand, dealer_hand, false, winner)
      break
    end
  end
end
# rubocop:enable Metrics/MethodLength: Method has too many lines

def dealers_choice?(dealers_hand)
  if calc_hand(dealers_hand) >= DEALER_AUTO_STAY_SCORE
    'stay'
  else
    'hit'
  end
end

def dealer_turn(dealer_hand, player_hand, deck, winner, scores_hash, player_id)
  loop do
    display_hands(:player, :dealer, player_hand, dealer_hand, false)
    puts
    if busted?(scores_hash, player_id) 
      gen_display_busted(:dealer, player_hand, dealer_hand, false, winner)
      break
    elsif dealers_choice?(dealer_hand) == 'stay'
      puts "Dealer chooses to stay"
      sleep(STAND_TIMER)
      break
    else
      update_hand(dealer_hand, deck, 'dealer')
      scores_hash[player_id] = calc_hand(dealer_hand)
      sleep(STAND_TIMER)
    end
  end
end

def update_score(hand, scores_hash, player_id)
  scores_hash[player_id] = calc_hand(hand)
end

def calc_winner(scores_hash)
  if scores_hash[:player] > scores_hash[:dealer]
    'player'
  elsif scores_hash[:player] < scores_hash[:dealer]
    'dealer'
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

def end_game(dealer_hand, player_hand, scores_hash, player_id, dealer_id)
  system 'clear'
  display_hand(:dealer, dealer_hand, false)
  display_hand(:player, player_hand, false)
  puts
  update_score(dealer_hand, scores_hash, dealer_id)
  update_score(player_hand, scores_hash, player_id)
  winner = calc_winner(scores_hash)
  display_winner(winner, scores_hash)
end

def goodbye
  sleep(STAND_TIMER)
  system 'clear'
  puts "Thanks for playing Twenty One.  Goodbye!"
end

# main game loop
scores = { dealer: 0,
           player: 0 }

loop do
  deck = initialize_deck

  player_hand = []
  dealer_hand = []
  winner = []

  initial_deal(deck, player_hand)
  initial_deal(deck, dealer_hand)

  player_turn(dealer_hand, player_hand, deck, winner, scores, :player)
  dealer_turn(dealer_hand, player_hand, deck, winner, scores, :dealer) if winner.empty?

  end_game(dealer_hand, player_hand, scores, :player, :dealer) if winner.empty?

  break if play_again? == false
end

goodbye
