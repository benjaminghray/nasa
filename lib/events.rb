
#store info on events 
#return info based on user selection  (1-13)
#use api to find the data to return to tbe user
module Nasa


    class Events
        attr_accessor :title, :category_id
        
        def initialize (title, category_id)
        
        @title = title
        @category_id = category_id
        @@events << self
        end
        @@events = []
        def self.all
            @@events
        end
        def self.events_by_categorie (id)
            self.all.select do |w|
            w.category_id == id
            end
      
          end
    end
       

end