module Concensus
  class Congressional < Resource
    
    def self.find(state, name = nil)
      if Concensus::configuration.year == 2010
        attribute_key = "NAMELSAD10"
        shp_file_path = get_and_unzip("CD/111/tl_2010_#{state_code_to_id(state)}_cd111.zip")
        return process_find(shp_file_path, attribute_key, state, name)  
      else
        raise NoResourceForYear
      end
    end

    def self.find_all(state)
      find(state)       
    end

  end
end