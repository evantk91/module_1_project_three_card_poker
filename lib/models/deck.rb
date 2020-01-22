require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class Hand
    attr_reader :url

    def initialize url
        @url = url
    end

    def deck_id
        #get deck data for deck id
        deck_data = RestClient.get(self.url)
        #parse deck data and pull deck id
        parsed_deck = JSON.parse(deck_data)
        parsed_deck["deck_id"]
    end

    def deal_from_deck(deck_id)
        #set url to pull three cards from API
        url = "https://deckofcardsapi.com/api/deck/#{deck_id}/draw/?count=3"
        
        #get card and parse data for 3 cards from API
        card_data = RestClient.get(url)
        parsed_card_data = JSON.parse(card_data)
        
        #pull cards from card data
        cards = parsed_card_data["cards"]

        #pull card code for each card
        cards.map do |card|
            card["code"]
        end  
    end

end

def is_straight?(hand_array)

    #store and convert card values into integers for comparison
    card_values = []
    hand_array.map do |card|
        case card[0]
        when 'J'
            card_value << 11
        when 'Q'
            card_value << 12
        when 'K'
            card_value << 13
        when 'A'
            card_value << 14
        else 
            card_value << card[0].to_i
        end
    end

    sorted_values = card_values.sort
    if sorted_values[0] == sorted_values[1] - 1 && sorted_values[1] == sorted_values[2] - 1
        return true
    else
        return false
    end
end

def is_flush(suits)
    flushes = [['S','S', 'S'], ['C', 'C', 'C'], ['H', 'H', 'H'], ['D', 'D', 'D']]
    flushes.include?(suits)
end

#def is_straight_flush()

#def hand_value(hand_array)

 #   card_value = []
 #   suits = []

    

  #  suits
#end

#binding.pry