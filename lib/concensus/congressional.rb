module Concensus
  class Congressional < Resource
    
    # @return [Concensus::Resource] matched congressional district
    def self.find(state, name = nil)
      shp_file_path = get_and_unzip("CD/111/tl_2010_#{state_code_to_id(state)}_cd111.zip")
      return process_find(shp_file_path, "NAMELSAD10", state, name)      
    end
    
    # @return [Array] array of all congressional districts for a state
    def self.find_all(state)
      find(state)       
    end

  end
end