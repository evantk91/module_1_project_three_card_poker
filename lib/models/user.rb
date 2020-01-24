class User < ActiveRecord::Base
    # attr_accessor :name, :purse

    # def initialize name, purse
    #     @name = name
    #     @purse = purse
    # end

    def welcome
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

        #displays welcome message
        system "clear"
        puts "Welcome to 3 Card Poker #{self.name}!"
        puts "I promise we wont take your money"
        puts " "
    end

    def view_rules?
        puts "Would you like to read the rules first? Y/N"
        rules_response = gets.chomp.downcase

        if rules_response == 'y'
            system "clear"
            puts "-place an ante to see your hand\n"
            puts "-place an optional pair plus bet for the pair plus bonus\n"
            puts "(pair: 1 to 1, flush: 4 to 1, straight: 5 to 1, three of a kind: 30 to 1, straight flush: 40 to 1)\n"
            puts "-you have the option to play or fold based on if you think you will beat the dealer\n"
            puts "-pair plus pays out regardless\n"
            puts "-if you beat the dealer, you win 1 to 1 on the ante and play bet.\n"
            puts "-if the dealer, wins you get nothing!!"
        end
        puts " "
    end

    def show_purse
        puts "Your current purse is #{self.purse}"
    end

    def get_ante(purse)
        puts "How much would you like to Ante? (enter 0 to stop playing)"
        ante = gets.chomp.to_i

        if ante > purse
            puts "You don't have enough money for that! Enter a lower value:"
            self.get_ante(purse)
        end

        if ante < 0
            puts "You can't bet negative money!"
            self.get_ante(purse)
        end

        ante
    end

    def get_pair_plus_bet(purse)
        puts "How much would you like to bet on Pair Plus?"
        pair_plus_bet = gets.chomp.to_i

        if pair_plus_bet > purse
            puts "You don't have enough money for that! Enter a value less than $#{purse}:"
            self.get_pair_plus_bet(purse)
        end
        
        if pair_plus_bet < 0
            puts "You can't bet negative money!"
            self.get_pair_plus_bet(purse)
        end

        pair_plus_bet
    end

    def show_hand(hand)
        puts "#{hand}"
    end

    def run_round
        #requests the user's ante
        ante = self.get_ante(self.purse)
        self.purse -= ante
        puts " "

        if ante == 0
            return ante
        end

        #requests the self's pair plus bet
        pair_plus_bet = self.get_pair_plus_bet(self.purse)
        self.purse -= pair_plus_bet
        puts " "
        puts "Your current purse is now $#{self.purse}"
        system "clear"

        #code for dealing player_hand and dealer_hand
        deck = Deck.new('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
        deck_id = deck.deck_id

        players_hand = deck.deal_from_deck(deck_id)
        dealers_hand = deck.deal_from_deck(deck_id)

        players_hand_type = hand_value(players_hand)[0]
        pp_payout = pair_plus_payout(pair_plus_bet, players_hand_type)

        puts "Current Purse: $#{self.purse} \n\n"
        puts "Your Hand: \n\n"
        self.show_hand(players_hand)
        puts "\n"
        puts "Would you like to play or fold (type p for play, f for fold)"
        play_fold = gets.chomp.downcase
        system "clear"

        if play_fold == 'f'
            self.purse += pp_payout

            puts "Current Purse: $#{self.purse} \n\n"
            puts "Your Hand: \n\n"
            self.show_hand(players_hand)
            puts "\n"

            return self.purse

        elsif play_fold == 'p'
            play = ante
            #subtract play bet from purse
            self.purse -= play
            #pays out pair plus bonus
            self.purse += pp_payout
            #compares dealer hand and player hand
            if player_wins?(players_hand, dealers_hand)
                self.purse += ante * 2 + play * 2

                puts "Current Purse: $#{self.purse} \n\n"
                puts "Your Hand: \n\n"
                self.show_hand(players_hand)
                puts "\n"
                puts "Dealers Hand: \n\n"
                self.show_hand(dealers_hand)
                puts "\n"
                puts "Congrats"
                sleep (3)
            else
                puts "Current Purse: $#{self.purse} \n\n"
                puts "Your Hand: \n\n"
                self.show_hand(players_hand)
                puts "\n"
                puts "Dealers Hand: \n\n"
                self.show_hand(dealers_hand)
                puts "\n"
                puts "Ah, too bad buddy, you lose!"
                sleep (3)
            end

            return self.purse
        end
    end

end