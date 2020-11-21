##require "nasa/version"

module Nasa
  class Cli
    def greeting
      puts "Hey, Welcome to the Nasa World Event gem. Would you like to view a list of natural events/disters and get information on them? "
      input = gets.chomp.downcase
      if input == "yes"
        Nasa::Categories.display_categories
        select_categorie
      
      end
    end
    def select_categorie
      puts "please enter corresponding under #{Nasa::Categories.titles.length+1}"
      input = gets.chomp.to_i
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
      def print_events(events)
        events.each do |e|
          puts "#{e.title}"
          puts "~~~~~~~~~~"
        end

      end
  end
end

#loop back to user
#display amount of events in category
#what happens to a category with 0 events 
