class User
    attr_accessor :name, :purse

    def initialize name, purse
        @name = name
        @purse = purse
    end

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
        rules_response = gets.chomp

        if rules_response == 'Y'
            rules = open("https://www.table-games-online.com/3-card-poker/rules.html")
        end
        puts " "
        sleep(1)
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

        if ante == 0
            #display end of game
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

end