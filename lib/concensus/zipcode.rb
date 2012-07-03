module Concensus
  class Zipcode < Resource
    
    def self.find(state, name = nil)
      
      if Concensus::configuration.year == 2010
        attribute_key = "ZCTA5CE10"
        shp_file_path = get_and_unzip("ZCTA5/2010/tl_2010_#{state_code_to_id(state)}_zcta510.zip")
      else
        raise NoResourceForYear
      end

      return process_find("Zipcode", shp_file_path, attribute_key, state, name)      
      
    end
    
    def self.find_all(state)
      find(state)       
    end
    
  end
end