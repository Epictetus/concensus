module Concensus
  class Place < Resource
  
    # @return [Concensus::Resource] matched place
    def self.find(state, name = nil)
      shp_file_path = get_and_unzip("PLACE/2010/tl_2010_#{state_code_to_id(state)}_place10.zip")
      return process_find(shp_file_path, "NAME10", state, name)      
    end
    
    # @return [Array] all places for a state
    def self.find_all(state)
      find(state)       
    end
    
  end
end