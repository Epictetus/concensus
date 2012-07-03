module Concensus
  class StateLegislative < Resource
    
    class Upper < StateLegislative
      def self.find(state, name = nil)
        if Concensus::configuration.year == 2011
          attribute_key = "NAMELSAD"
          shp_file_path = get_and_unzip("SLDU/tl_2011_#{state_code_to_id(state)}_sldu.zip")
        elsif Concensus::configuration.year == 2010
          attribute_key = "NAMELSAD10"
          shp_file_path = get_and_unzip("SLDU/2010/tl_2010_#{state_code_to_id(state)}_sldu10.zip")
        end

        return process_find(shp_file_path, attribute_key, state, name)      
      end

      def self.find_all(state)
        find(state)       
      end      
    end
    
    class Lower < StateLegislative
      def self.find(state, name = nil)
        if Concensus::configuration.year == 2011
          attribute_key = "NAMELSAD"
          shp_file_path = get_and_unzip("SLDL/tl_2011_#{state_code_to_id(state)}_sldl.zip")
        elsif Concensus::configuration.year == 2010
          attribute_key = "NAMELSAD10"
          shp_file_path = get_and_unzip("SLDL/2010/tl_2010_#{state_code_to_id(state)}_sldl10.zip")
        end

        return process_find(shp_file_path, attribute_key, state, name)      
      end

      def self.find_all(state)
        find(state)       
      end      
    end
    
  end
end