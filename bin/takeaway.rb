#!/usr/bin/env ruby

require_relative '../lib/order'
require_relative '../lib/text'
require_relative '../lib/twilio'

order = Order.new

puts "Welcome to the takeaway!"
loop do
	puts "Would you like to add a dish? Type the name of a dish, or 'done' when you are finished adding dishes."
	dish = gets.chomp
	break if dish == "done"
	puts "How many #{dish} would you like?"
	quantity = gets.chomp.to_i
	order.chosen_dishes(dish, quantity)
end

puts "Thank you for your order. We will send you a text with the estimated delivery time."

twilio = TwilioText.new
text = Text.new(order)
twilio.send_text(text)
