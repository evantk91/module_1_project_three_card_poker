# #rough draft of what is in console.rb

# require_relative '../config/environment'
# require 'pry'
# require 'open-uri'

# class Game


#     def run_round
#         #requests the user's ante
#         ante = user.get_ante(user.purse)
#         user.purse -= ante
#         puts " "

#         #requests the user's pair plus bet
#         pair_plus_bet = user.get_pair_plus_bet(user.purse)
#         user.purse -= pair_plus_bet
#         puts " "
#         puts "Your current purse is now $#{user.purse}"
#         system "clear"

#         #code for dealing player_hand and dealer_hand
#         deck = Deck.new('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
#         deck_id = deck.deck_id

#         players_hand = deck.deal_from_deck(deck_id)
#         dealers_hand = deck.deal_from_deck(deck_id)

#         players_hand_type = hand_value(players_hand)[0]
#         pp_payout = pair_plus_payout(pair_plus_bet, players_hand_type)

#         puts "Current Purse: $#{user.purse} \n\n"
#         puts "Your Hand: \n\n"
#         user.show_hand(players_hand)
#         puts "\n"
#         puts "Would you like to play or fold (type p for play, f for fold)"
#         play_fold = gets.chomp.downcase
#         system "clear"

#         if play_fold == 'f'
#             user.purse += pp_payout

#             puts "Current Purse: $#{user.purse} \n\n"
#             puts "Your Hand: \n\n"
#             user.show_hand(players_hand)
#             puts "\n"

#             return user.purse

#         elsif play_fold == 'p'
#             play = ante
#             #subtract play bet from purse
#             user.purse -= play
#             #pays out pair plus bonus
#             user.purse += pp_payout
#             #compares dealer hand and player hand
#             if player_wins?(players_hand, dealers_hand)
#                 user.purse += ante * 2 + play * 2

#                 puts "Current Purse: $#{user.purse} \n\n"
#                 puts "Your Hand: \n\n"
#                 user.show_hand(players_hand)
#                 puts "\n"
#                 puts "Dealers Hand: \n\n"
#                 user.show_hand(dealers_hand)
#                 puts "\n"
#                 puts "Congrats"
#             else
#                 puts "Current Purse: $#{user.purse} \n\n"
#                 puts "Your Hand: \n\n"
#                 user.show_hand(players_hand)
#                 puts "\n"
#                 puts "Dealers Hand: \n\n"
#                 user.show_hand(dealers_hand)
#                 puts "\n"
#                 puts "Ah, too bad buddy, you lose!"
#             end

#             return user.purse
#         end
#     end

# end