require_relative '../config/environment'
require 'pry'
require 'open-uri'

system "clear"
puts " ____"
puts "|__ /"
puts " |_ \\"
puts "|___/" 
sleep(1)

system "clear"
puts "___ "
puts "|_  )"
puts " / / "
puts "/___|"
sleep(1)

system "clear"
puts "  _ "
puts " / |"
puts " | |"
puts " |_|"
sleep(1)

system "clear"
puts "Welcome to 3 Card Poker!"
puts " "
puts "Would you like to read the rules first? Y/N"
rules_response = gets.chomp
if rules_response == 'Y'
    rules = open("https://www.table-games-online.com/3-card-poker/rules.html")
end
puts " "
purse = 1000
puts "Your starting purse is $1000"
puts " "
puts "How much would you like to Ante?"
ante = gets.chomp.to_i
if ante > purse
    puts "You don't have enough money for that! Enter a lower value:"
    ante = gets.chomp.to_i
elsif ante < 0
    puts "You can't bet negative money!"
    ante = gets.chomp.to_i
end
puts " "
puts "How much would you like to bet on Pair Plus?"
pair_plus = gets.chomp.to_i
if pair_plus > purse
    puts "You don't have enough money for that! Enter a value less than $#{purse}:"
    pair_plus = gets.chomp.to_i
elsif pair_plus < 0
    puts "You can't bet negative money!"
    pair_plus = gets.chomp.to_i
end
puts " "
# puts "Your remaining purse is now $#{purse}!"

#code for dealing player_hand and dealer_hand
deck1 = Deck.new('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
deck1_id = deck1.deck_id

players_hand = deck1.deal_from_deck(deck1_id);
dealers_hand = deck1.deal_from_deck(deck1_id);
puts "Your hand: #{players_hand}"
puts " "
puts "Would you like to Play or Fold?"
play_res = gets.chomp.downcase
if play_res == 'fold'
    #code for showing dealer_hand
    purse -= ante
    puts " "
    puts "Dealer's hand: #{dealers_hand}"
    puts " "
    puts "You folded! Your remaining purse is $#{purse}." 
    puts " "
elsif play_res == 'play'
    play = ante
    player_compare = players_hand.max
    dealer_compare = dealers_hand.max
    if is_pair(players_hand)
        player_compare = 15
    elsif is_flush(players_hand)
        player_compare = 16
    elsif is_straight?(players_hand)
        player_compare = 17
    elsif three_of_a_kind(players_hand)
        player_compare = 18
    elsif is_straight(players_hand) && is_flush(players_hand)
        player_compare = 19
    end
    if hand_type(dealer_hand) = "pair"
        dealer_compare = 15
    elsif is_flush(dealers_hand)
        dealer_compare = 16
    elsif is_straight?(dealers_hand)
        dealer_compare = 17
    elsif three_of_a_kind(dealers_hand)
        dealer_compare = 18
    elsif is_straight(dealers_hand) && is_flush(dealers_hand)
        dealer_compare = 19
    end

end
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




