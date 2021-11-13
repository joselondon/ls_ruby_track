VALID_HIT = ['hit', 'h']
VALID_STAY = ['stay', 's']
COURTS_CARDS = ["Jack", "Queen", "King"]
STAND_TIMER = 2
scores = { dealer: 0,
           player: 0 }

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  deck = []
  ranks = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
  suits = %w(Spades Hearts Diamonds Clubs)
  suits.each do |suit|
    ranks.size.times do |i|
      deck << [ranks[i], suit]
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

def has_have(player)
  if player.downcase == 'player'
    'You have: '
  elsif player.downcase == 'dealer'
    'Dealer has: '
  else
    '[INVALID] has/have: '
  end
end

def display_hand(player_str, hand, hide = true)
  print "#{has_have(player_str)}"
  hand.each do |card|
    if card == hand.last
      puts "and #{card[0]}"
    elsif card == hand.first && player_str.downcase == 'Dealer' &&
          hide == true
          print "[HIDDEN] "
    else
      print "#{card[0]}, "
    end
  end
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

def display_hands(dealer, player)
  display_dealer_hand(dealer)
  display_player_hand(player)
end

def update_hand(hand, deck, player_string)
  card = deal_card(deck)
  hand << card
  puts "#{player_string} dealt:  #{card[0]} of #{card[1]}"
end

def calc_ace(hand, ace = 11)
  if !hand.flatten.include?('Ace')
    return 0
  elsif calc_hand_excl_aces(hand) > 10
    ace = 1
  end
  ace
end

def calc_sum_of_pip_cards(hand)
  hand.flatten.map(&:to_i).sum
end

def calc_sum_of_court_cards(hand)
  hand.flatten.map do |e|
    val = 0
    if COURTS_CARDS.include?(e)
      val += 10
    elsif e == "Ace"
      0
    end
    val
  end
end

def calc_hand_excl_aces(hand)
  value_of_pips = calc_sum_of_pip_cards(hand)
  value_of_courts = calc_sum_of_court_cards(hand)
  value_of_courts.sum + value_of_pips
end

def calc_hand(hand)
  calc_hand_excl_aces(hand) + calc_ace(hand)
end

def busted?(hand)
  (calc_ace(hand) + calc_sum_of_court_cards(hand).sum +
  calc_sum_of_pip_cards(hand)) > 21
end

def dealers_choice?(dealers_hand)
  if calc_hand(dealers_hand) >= 17
    'stay'
  else
    'hit'
  end
end

def calc_scores(player_hand, dealer_hand, scores_hash)
  scores_hash[:player] = calc_hand(player_hand)
  scores_hash[:dealer] = calc_hand(dealer_hand)
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

deck = initialize_deck

player_hand = []
dealer_hand = []
winner = ''

initial_deal(deck, player_hand)
initial_deal(deck, dealer_hand)

loop do
  system 'clear'
  display_hand('Dealer', dealer_hand)
  display_hand('Player', player_hand)

  choice = ask_player_hit_or_stay?
  sleep(0.5)
  system 'clear'
  if VALID_STAY.include?(choice)
    break
  else
    update_hand(player_hand, deck, 'player')
    sleep(STAND_TIMER)
  end

  if busted?(player_hand)
    system 'clear'
    display_hand('Dealer', dealer_hand, false)
    display_hand('Player', player_hand)
    puts "You are busted!  Dealer Wins"
    winner = 'dealer'
    break
  end
end

if winner == ''
  loop do
    system 'clear'
    display_hand('Dealer', dealer_hand, false)
    display_hand('Player', player_hand)
    puts
    if busted?(dealer_hand)
      puts "Dealer is bust! Player Wins"
      winner = 'player'
      break
    elsif dealers_choice?(dealer_hand) == 'stay'
      puts "Dealer chooses to stay"
      sleep(STAND_TIMER)
      break
    else
      update_hand(dealer_hand, deck, 'dealer')
      sleep(STAND_TIMER)
    end
  end
end

if winner == ''
  system 'clear'
  display_hand('Dealer', dealer_hand, false)
  display_hand('Player', player_hand)
  puts
  calc_scores(player_hand, dealer_hand, scores)
  winner = calc_winner(scores)
  display_winner(winner, scores)
end
