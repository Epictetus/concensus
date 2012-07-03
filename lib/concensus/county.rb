module Concensus
  class County < Resource
  
    # @return [Concensus::Resource] matched county
    def self.find(state, name = nil)
      shp_file_path = get_and_unzip("COUNTY/2010/tl_2010_#{state_code_to_id(state)}_county10.zip")
      return process_find(shp_file_path, "NAME10", state, name)      
    end
    
    # @return [Array] all counties for a state
    def self.find_all(state)
      find(state)       
    end
    
  end
end