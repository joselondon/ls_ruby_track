require 'pry-byebug'
VALID_HIT = ['hit', 'h']
VALID_STAY = ['stay', 's']
COURTS_CARDS = ["Jack", "Queen", "King"]
STAND_TIMER = 2
VALID_YES = ['y', 'yes']
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
    if card == hand.last && hide == false
      puts "and #{card[0]}.  Hand value = #{calc_hand(hand)}"
    elsif card == hand.last && hide == true
      puts "and #{card[0]}."
    elsif card == hand.first && player_str.downcase == 'dealer' &&
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
        if calc_hand_excl_aces(hand) + aces_value > 10
          aces_value += 1
        else
          aces_value += 11
        end
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
  flattened = hand.flatten.map do |e|
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

def busted?(hand)
  (calc_ace(hand) + calc_sum_of_court_cards(hand) +
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

def play_again?
  prompt "Enter '(y)es' to play again, or any other key to exit"
  response = gets.chomp.downcase
  VALID_YES.include?(response)
end

loop do
deck = initialize_deck

player_hand = []
dealer_hand = []
winner = ''

initial_deal(deck, player_hand)
initial_deal(deck, dealer_hand)
  loop do
    system 'clear'
    display_hand('Dealer', dealer_hand)
    display_hand('Player', player_hand, false)
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
      display_hand('Player', player_hand, false)
      puts "You are busted!  Dealer Wins"
      winner = 'dealer'
      break
    end
  end

  if winner == ''
    loop do
      system 'clear'
      display_hand('Dealer', dealer_hand, false)
      display_hand('Player', player_hand, false)
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
    display_hand('Player', player_hand, false)
    puts
    calc_scores(player_hand, dealer_hand, scores)
    winner = calc_winner(scores)
    display_winner(winner, scores)
  end
  break if play_again? == false
end
sleep(STAND_TIMER)
system 'clear'
puts "Thanks for playing Twenty One.  Goodbye!"