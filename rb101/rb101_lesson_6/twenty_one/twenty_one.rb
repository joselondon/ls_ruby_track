require 'pry-byebug'
VALID_HIT = ['hit', 'h']
VALID_STAY = ['stay', 's']

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
    update_player_hand(player_hand, deck)
    break if VALID_STAY.include?(choice)
  end
end

deck = initialize_deck

player_hand = []
dealer_hand = []
scores = {dealer: 0,
          player: 0}

initial_deal(deck, player_hand)
initial_deal(deck, dealer_hand)

players_round(dealer_hand, player_hand, deck)
display_hands(dealer_hand, player_hand)


p "dealer turn"


