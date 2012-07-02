module Concensus
  class State < Resource
  
    def self.find(state)
      shp_file_path = get_and_unzip("STATE/2010/tl_2010_#{state_code_to_id(state)}_state10.zip", 
                                          "State-#{state}-#{Concensus::configuration.year}")
      return process_find(shp_file_path, state)[0]      
    end
    
    def self.find_all
      shapes = []
      Concensus::configuration.census_state_ids.each do |state_code, _|
        shapes << find(state_code)
      end
      return shapes
    end
    
  end
end