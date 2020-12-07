##require "nasa/version"
require 'pry'
module Nasa
  class Cli
    def greeting
      puts "Hey, Welcome to the Nasa World Event gem. Would you like to view a list of natural events/disters and get information on them? "
      puts "(type 'yes','no', or 'exit')"
      puts ""
      input = gets.chomp.downcase 
      while input != "exit" do
      if input == 'yes'
        Nasa::Categories.display_categories
        select_categorie
      else 
        puts "you done messed up"
        greeting
      
      end
    end
    def select_categorie
      puts "please enter corresponding number under #{Nasa::Categories.titles.length+1}"
      input = gets.chomp
        puts 'Thanks for using my application!'
      else
        input = input.to_i
        if input == 0 || !input.between?(1,Nasa::Categories.titles.length)
         puts "wrong  answer"
         select_categorie
        else
         c = Nasa::Categories.categories[input -1]
         Nasa::API.get_events_by_categorie(c.id)
         d = Nasa::Events.events_by_categorie(c.id) 
         
          print_events(d)
        end
      end
    end
      def print_events(events)
      # binding.pry
       if events.empty? 
          puts 'There is no information on the event based on your answer'
       else 
         events.each do |e|
           puts "#{e.title}"
           puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
         end
       end
            
         puts 'do you want info on another event?'
        select_categorie
     end 
  end
end


