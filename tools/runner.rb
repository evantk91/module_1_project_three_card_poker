require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1
# require 'pry'
# require 'open-uri'

#get user name
system "clear"
puts "Hello, what\'s your name?"
username = gets.chomp
initial_purse = 1000
user = User.create(name: username, purse: initial_purse) 

#initialize user environment
user.welcome

#asks user if they would like to see the rules
user.view_rules?

#initialize purse
user.show_purse
puts " "

#first round
flag = user.run_round

while flag != 0
    system "clear"
    flag = user.run_round
end

user.update(purse: user.purse)

puts "Your final purse: $#{user.purse}\n\n"

puts "Would you like to view the leaderboard? (y/n)\n"
leaderboard_response = gets.chomp.downcase

if leaderboard_response == 'y'
    system "clear"
    puts "\nNAME  |  FINAL PURSE\n"
    leaderboard = User.all.sort_by {|user| user.purse}

    leaderboard.reverse.each do |user|
        puts "--------------------"
        puts "#{user.name} - #{user.purse}"
    end
end

puts "\nWould you like to remove your scores from the leaderboard? (y/n)\n"
leaderboard_response = gets.chomp.downcase
if leaderboard_response == "y"
    User.where(:name => user.name).delete_all
end

puts "\nWould you like to reset the leaderboard? (y/n)\n"
leaderboard_response = gets.chomp.downcase
if leaderboard_response == "y"
    User.delete_all
end

system "clear"
puts "------------------------------------"
puts "Thanks for playing. Come again yall!"
puts "------------------------------------"
sleep(3)
system "clear"