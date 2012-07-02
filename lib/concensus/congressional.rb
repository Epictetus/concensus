module Concensus
  class Congressional < Resource
    
    def self.find(state, name = nil)
      shp_file_path = get_and_unzip("CD/111/tl_2010_#{state_code_to_id(state)}_cd111.zip", 
                                          "Cd111-#{state}-#{Concensus::configuration.year}")
      return process_find(shp_file_path, "NAMELSAD10", state, name)      
    end

    def self.find_all(state)
      find(state)       
    end

  end
end