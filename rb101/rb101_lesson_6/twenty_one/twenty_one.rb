require 'pry'

def initialize_deck
  deck = []
  ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
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

deck = initialize_deck

player_hand = []
ai_hand = []

initial_deal(deck, player_hand)
initialize_deck(deck, ai_hand)