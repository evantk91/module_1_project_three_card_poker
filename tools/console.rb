require_relative '../config/environment.rb'
require 'pry'

deck1 = Deck.new('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
deck_id = deck1.deck_id

players_hand = deck1.deal_from_deck(deck_id);
dealers_hand = deck1.deal_from_deck(deck_id);

test_hand = ['8C', '9C', '0C']


binding.pry
#deck1.draw_three_cards(deck1_id)
