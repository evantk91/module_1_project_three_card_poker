require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class Deck
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

def sorted_hand_values(hand_array)
    #store and convert card values into integers for comparison
    card_values = []
    hand_array.map do |card|
        case card[0]
        when '0'
            card_values << 10
        when 'J'
            card_values << 11
        when 'Q'
            card_values << 12
        when 'K'
            card_values << 13
        when 'A'
            card_values << 14
        else 
            card_values << card[0].to_i
        end
    end
    
    #sort values for comparison
    sorted_values = card_values.sort
end

def is_straight?(hand_array)
    #sort hand values
    sorted_values = sorted_hand_values(hand_array)

    #determine if cards make up a straight
    if sorted_values[0] == sorted_values[1] - 1 && sorted_values[1] == sorted_values[2] - 1
        return true
    else
        return false
    end
end

def is_flush?(hand_array)

    #store the suits of the cards
    suits = []
    suits = hand_array.map {|card| card[card.length-1]}

    #determine if cards make up a flush
    flushes = [['S','S', 'S'], ['C', 'C', 'C'], ['H', 'H', 'H'], ['D', 'D', 'D']]
    flushes.include?(suits)
end

def is_straight_flush?(hand_array)
    #check for straight and check for flush
    if is_straight?(hand_array) && is_flush?(hand_array)
        return true
    else
        return false
    end
end

def is_three_of_a_kind?(hand_array)
    #sort hand values
    sorted_values = sorted_hand_values(hand_array)

    #determine if cards make up a three of a kind
    if sorted_values.uniq.length == 1
        return true
    else
        return false
    end
end

def is_pair?(hand_array)
    #sort hand values
    sorted_values = sorted_hand_values(hand_array)

    #determine if two cards make up a pair
    if sorted_values[0] == sorted_values[1] || sorted_values[1] == sorted_values[2]
        return true
    else
        return false
    end
end

def pair_info(hand_array)
    #sort hand values
    sorted_values = sorted_hand_values(hand_array)

    #return pair value and other card value
    if sorted_values[0] == sorted_values[1]
        pair_value = sorted_values[0]
        other_card = sorted_values[2]
        return[pair_value, other_card]
    else sorted_values[1] == sorted_values[2]
        pair_value = sorted_values[1]
        other_card = sorted_values[0]
        return[pair_value, other_card]
    end
end

def hand_value(hand_array)

    #initialize hand type and determine high card
    hand_type = ''
    high_card = sorted_hand_values(hand_array)[2]

    #return hand type and appropriate information
    if is_straight_flush?(hand_array)
        return ["Straight Flush", high_card]
    elsif is_flush?(hand_array)
        return ["Flush", high_card]
    elsif is_straight?(hand_array)
        return ["Straight", high_card]
    elsif is_three_of_a_kind?(hand_array)
        return ["Three of a Kind", high_card]
    elsif is_pair?(hand_array)
       pair_value = pair_info(hand_array)[0]
       other_card = pair_info(hand_array)[1]
       return ["Pair", pair_value, other_card]
    else
        return ["No Pair", high_card]
    end

end