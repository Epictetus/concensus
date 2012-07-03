module Concensus
  class Place < Resource
    
    def self.find(state, name = nil)
      
      if Concensus::configuration.year == 2011
        attribute_key = "NAMELSAD"
        shp_file_path = get_and_unzip("PLACE/tl_2011_#{state_code_to_id(state)}_place.zip")
      elsif Concensus::configuration.year == 2010
        attribute_key = "NAME10"
        shp_file_path = get_and_unzip("PLACE/2010/tl_2010_#{state_code_to_id(state)}_place10.zip")
      end

      return process_find("Place", shp_file_path, attribute_key, state, name)      
      
    end
    
    def self.find_all(state)
      find(state)       
    end
    
  end
end