require "pry"
module Nasa
    class API
        def get_categories 
            
           url = "https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories"
           response = RestClient.get(url) 
           data = JSON.parse(response)
              data["categories"].each do |i|
                Nasa::Categories.new(i["id"],i["title"],i["description"])
              end

        end
           def self.get_events_by_categorie(id)
            url = "https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories/#{id}"
            response = RestClient.get(url) 
            data = JSON.parse(response)
            data["events"].each do |i|
              Nasa::Events.new(i["title"],id)
            end
           
           end
           
    end
end