require_relative '../config/environment.rb'
require 'pry'

deck1 = Deck.new('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
deck1_id = deck1.get_new_deck_id

players_hand = deck1.deal_three_cards(deck1_id);
dealers_hand = deck1.deal_three_cards(deck1_id);

binding.pry
#deck1.draw_three_cards(deck1_id)