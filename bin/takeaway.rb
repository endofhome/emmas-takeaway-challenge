#!/usr/bin/env ruby

require_relative '../lib/order'
require_relative '../lib/text'
require_relative '../lib/twilio'

dishes = [
		   {"snack seaweed" => 1.95},
           {"oven roasted garlic" => 1.95},
           {"tamari & black sesame rice crackers" => 2.95},
           {"wild rice with truffles" => 2.95},
           {"natto with hot mustard and sesame oil" => 2.95},
           {"kimchi" => 2.95},
           {"pickled vegetables" => 2.95},
           {"smokey garlic broccolini" => 3.95},
           {"agedashi tofu with soy and ginger dipping sauce" => 4.95},
           {"vegetable tempura with wasabi and miso sauce" => 5.95},
           {"spicy vegan dumpling noodle soup" => 5.95},
           {"smoky huitlacoche, chilli sauce, vegan cheese, avocado and quesadillas" => 5.95},
           {"dark chocolate coated fresh strawberries" => 4.95},
           {"cashew, pistachio and rose vegan cheesecake" => 4.95},
           {"glass of ginger and tumeric kombucha" => 2.95},
           {"glass of elderberry water kefir" => 2.95},
           {"warm spiced chai" => 2.95 },
           {"bottle of champagne" => 69.95}
         ]
menu = Menu.new(dishes)
order = Order.new(menu)
puts "Welcome to the takeaway!"

loop do
  puts "Please type 'menu' for the menu, and 'order' to place an order."
  option = gets.chomp
  if option == "menu" 
  	puts menu.printed_list
  elsif option == "order"
  	break
  else 
  	puts "I'm sorry, I didn't understand what you would like to do."
  end
end

loop do
  puts "Would you like to add a dish? Type the name of a dish, or 'done' when you are finished adding dishes."
  dish = gets.chomp
  break if dish == "done"
  puts "How many #{dish} would you like?"
  quantity = gets.chomp.to_i
  order.chosen_dishes(dish, quantity)
  puts "#{quantity} #{dish} added to your order"
end

puts "Thank you for your order. We will send you a text with the estimated delivery time."
twilio = TwilioText.new
text = Text.new(order)
twilio.send_text(text)