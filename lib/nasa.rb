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
      input = gets.chomp.downcase
      
    end
  end
end


