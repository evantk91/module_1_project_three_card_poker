require_relative '../config/environment'
# require 'pry'
# require 'open-uri'

#get user name
system "clear"
puts "Hello, whats you name?"
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
user.run_round

