module Concensus
  class County < Resource
    
    def self.find(state, name = nil)
      if Concensus::configuration.year == 2010
        attribute_key = "NAME10"
        shp_file_path = get_and_unzip("COUNTY/2010/tl_2010_#{state_code_to_id(state)}_county10.zip")
        return process_find("County", shp_file_path, attribute_key, state, name)  
      else
        raise NoResourceForYear
      end
    end

    def self.find_all(state)
      find(state)       
    end
    
  end
end