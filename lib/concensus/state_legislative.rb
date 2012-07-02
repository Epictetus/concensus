module Concensus
  class StateLegislative < Resource
    
    class Upper < StateLegislative
      def self.find(state, name = nil)
        shp_file_path = get_and_unzip("SLDU/2010/tl_2010_#{state_code_to_id(state)}_sldu10.zip", 
                                            "Sldu-#{state}-#{Concensus::configuration.year}")
        return process_find(shp_file_path, "NAMELSAD10", state, name)      
      end

      def self.find_all(state)
        find(state)       
      end
    end
    
    class Lower < StateLegislative
      def self.find(state, name = nil)
        shp_file_path = get_and_unzip("SLDL/2010/tl_2010_#{state_code_to_id(state)}_sldl10.zip", 
                                            "Sldl-#{state}-#{Concensus::configuration.year}")
        return process_find(shp_file_path, "NAMELSAD10", state, name)      
      end

      def self.find_all(state)
        find(state)       
      end      
    end
    
  end
end