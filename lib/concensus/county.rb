module Concensus
  class County < Resource
  
    def self.find(state, name = nil)
      shp_file_path = get_shp_and_convert("COUNTY/2010/tl_2010_#{state_code_to_id(state)}_county10.zip", 
                                          "County-#{state}-#{Concensus::configuration.year}")
      return process_find(shp_file_path, state, name)      
    end
    
    def self.find_all(state)
      find(state)       
    end
    
  end
end