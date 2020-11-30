require "pry"
module Nasa
    class Categories
        attr_accessor :id , :title, :description

        def initialize(id, title, description)
            @id = id
            @title = title
            @description = description

            @@categories << self
        end

        @@categories = []
        
        def self.categories
            @@categories
        end

        def self.titles
            self.categories.collect do |i|
             i.title
            end
        end
        
        def self.display_categories
            self.titles.each.with_index(1) do |x,y|
                puts "#{y}. #{x}"  
            
            end
        end

    end
end
