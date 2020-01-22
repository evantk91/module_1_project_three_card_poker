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
purse -= ante
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
purse -= pair_plus
puts " "
puts "Your remaining purse is now $#{purse}!"