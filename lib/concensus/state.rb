module Concensus
  class State < Resource
      
    # @return [Concensus::Resource] matched state
    def self.find(state)
      
      if Concensus::configuration.year == 2010
        shp_file_path = get_and_unzip("STATE/2010/tl_2010_#{state_code_to_id(state)}_state10.zip")
        return process_find(shp_file_path, "NAME10", state)[0]  
      else
        raise NoResourceForYear
      end
          
    end
    
    # @return [Array] all states
    def self.find_all
      shapes = []
      Concensus::configuration.census_state_ids.each do |state_code, _|
        shapes << find(state_code)
      end
      return shapes
    end
    
  end
end