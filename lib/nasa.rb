##require "nasa/version"
require 'pry'
module Nasa
  class Cli
    def greeting
      puts ''
      puts "                  Hi, Welcome to the Nasa World Event gem!"
      puts '            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
       puts "Would you like to view a list of natural events/disasters and get information on them?"
       puts""
       puts "                          Type 'yes' or 'no'"
       puts ""
      input = gets.chomp.downcase 
      if input == 'yes'
        Nasa::Categories.display_categories
        select_categorie
      elsif input == 'no'
        puts ""
        puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        puts 'Thanks for using my application!'
        puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        exit
      else 
        greeting
      
      end
    end
    def select_categorie
      puts""
      puts "Please enter corresponding number under #{Nasa::Categories.titles.length+1}"
      input = gets.chomp
      if input == 'exit'
        puts ""
        puts 'Thanks for using my application!'
          exit
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
       if events.empty? 
          puts ''
          puts 'There is no information on the event based on your answer'
       else 
         events.each do |e|
           puts "#{e.title}"
           puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
         end
       end
         puts ""   
         puts "Type 'exit' if you are finished. Follow the next prompt if you want to continue." 
        select_categorie
     end 
  end
end


