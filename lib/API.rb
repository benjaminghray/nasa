module Nasa
    class API
        def get_categories 
            
           url = "https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories"
           response = RestClient.get(url) 
           data = JSON.parse(response)
              data["categories"].each do |i|
                Categories.new(i["id"],i["title"],i["description"])
              end
        end
           
    end
end