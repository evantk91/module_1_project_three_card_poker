require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class Deck
    attr_reader :url

    def initialize url
        @url = url
    end

    def get_new_deck_id
        #get deck data for deck id
        deck_data = RestClient.get(self.url)
        #parse deck data and pull deck id
        parsed_deck = JSON.parse(deck_data)
        parsed_deck["deck_id"]
    end

    def deal_three_cards(deck_id)
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

#binding.pry