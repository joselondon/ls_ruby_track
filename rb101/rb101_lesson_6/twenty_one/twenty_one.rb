require 'pry-byebug'
VALID_HIT = ['hit', 'h']
VALID_STAY = ['stay', 's']
COURTS_CARDS = ["Jack", "Queen", "King"]

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  deck = []
  ranks = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}
  suits = %w{Spades Hearts Diamonds Clubs}
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
  2.times { |i| hand << deal_card(deck) }
end

def display_player_hand(player_hand)
  puts "You have: #{player_hand[0][0]} and #{player_hand[1][0]}"
end

def display_dealer_hand(dealer_hand)
  puts "Dealer has: ???? and #{dealer_hand[1][0]}"
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

def update_player_hand(player_hand, deck)
  player_hand << deal_card(deck)
end

def players_round(dealer_hand, player_hand, deck)
  loop do
    display_hands(dealer_hand, player_hand)
    puts
    choice = ask_player_hit_or_stay?()
    if VALID_STAY.include?(choice)
      break
    else
      update_player_hand(player_hand, deck)
    end
    calculate_hand(player_hand)
  end
end

def calc_ace(hand, ace = 11)
  ace = 1 if calc_hand_excl_aces(hand) > 10
  ace
end

def calculate_sum_of_pip_cards (hand)
  value_of_ints = hand.flatten.map {|e| e.to_i}.sum
end

def calc_hand_excl_aces(hand)
  value_of_pips = calculate_sum_of_pip_cards(hand)
  courts = hand.flatten.map do |e|
    val = 0
    if COURTS_CARDS.include?(e)
      val += 10
    elsif e == "Ace"
      e = 0
    end
    val
  end
  value_of_courts = courts.sum
  value_of_courts + value_of_pips
end

def busted?(hand)
  false
end

deck = initialize_deck

player_hand = []
dealer_hand = []
scores = {dealer: 0,
          player: 0}

initial_deal(deck, player_hand)
initial_deal(deck, dealer_hand)
binding.pry
loop do
  display_hands(dealer_hand, player_hand)
  choice = ask_player_hit_or_stay?()
  if VALID_STAY.include?(choice) || busted?(player_hand)
    break
  else 
    update_player_hand(player_hand, deck)
  end
  calc_hand_excl_aces(player_hand)
end

p "dealer turn"


