require_relative '../config/environment'
require 'pry'
require 'open-uri'

#get user name
system "clear"
puts "Hello, whats you name?"
username = gets.chomp
initial_purse = 1000
user = User.new(username, initial_purse) 

#initialize user environment
user.welcome

#asks user if they would like to see the rules
user.view_rules?

#initialize purse
user.show_purse
puts " "

#requests the user's ante
ante = user.get_ante(user.purse)
user.purse -= ante
puts " "

#requests the user's pair plus bet
pair_plus_bet = user.get_pair_plus_bet(user.purse)
user.purse -= pair_plus_bet
puts " "
puts "Your current purse is now $#{user.purse}"
system "clear"

#code for dealing player_hand and dealer_hand
deck = Deck.new('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
deck_id = deck.deck_id

players_hand = deck.deal_from_deck(deck_id);
dealers_hand = deck.deal_from_deck(deck_id);

puts "Current Purse: $#{user.purse} \n\n"
puts "Your Hand: \n\n"
user.show_hand(players_hand)
puts "\n"
puts "Would you like to play or fold (type p for play, f for fold)"
play_fold = gets.chomp.downcase

if play_fold == 'f'
    
elsif play_fold == 'p'

end

#play_res = gets.chomp.downcase
#if play_res == 'fold'
    #code for showing dealer_hand
 #   purse -= ante
 #   puts " "
 #   puts "Dealer's hand: #{dealers_hand}"
 #   puts " "
 #   puts " "
#elsif play_res == 'play'
 #   play = ante
 #   player_compare = players_hand.max
 #   dealer_compare = dealers_hand.max
 #   if is_pair(players_hand)
 #       player_compare = 15
 #   elsif is_flush(players_hand)
 #       player_compare = 16
 #   elsif is_straight?(players_hand)
 #       player_compare = 17
 #   elsif three_of_a_kind(players_hand)
 #       player_compare = 18
 #   elsif is_straight(players_hand) && is_flush(players_hand)
 #       player_compare = 19
 #   end
 #   if hand_type(dealer_hand) = "pair"
 #       dealer_compare = 15
 #   elsif is_flush(dealers_hand)
 #       dealer_compare = 16
 #   elsif is_straight?(dealers_hand)
 #       dealer_compare = 17
 #   elsif three_of_a_kind(dealers_hand)
 #       dealer_compare = 18
 #   elsif is_straight(dealers_hand) && is_flush(dealers_hand)
 #       dealer_compare = 19
 #   end

#end
    #code for showing dealer_hand
    #compare player_hand.value with deal_hand.value
    #if ph_value > dh.value
        #purse += (ante + play)
    #elsif ph_value < dh.value
        #purse -= ante
    #else if ph.max > dh.max
            #purse += (ante + play)
        #elsof ph.max < dh.max
            #purse -= ante
        #else puts "Draw!"
        #end
    #end




