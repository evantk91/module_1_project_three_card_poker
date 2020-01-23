require_relative '../config/environment.rb'
require 'pry'

deck1 = Deck.new('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
<<<<<<< HEAD
deck1_id = deck1.deck_id

players_hand = deck1.deal_from_deck(deck1_id);
dealers_hand = deck1.deal_from_deck(deck1_id);
=======
deck_id = deck1.deck_id

players_hand = deck1.deal_from_deck(deck_id);
dealers_hand = deck1.deal_from_deck(deck_id);

test_hand = ['8C', '9C', '0C']

>>>>>>> 1d6f35cdfbf396ccf8ca126153d72ce46b175bd8

binding.pry
#deck1.draw_three_cards(deck1_id)
