module Concensus
  class StateLegislative < Resource
    
    class Upper < StateLegislative
      # @return [Concensus::Resource] matched state upper legislative district
      def self.find(state, name = nil)
        shp_file_path = get_and_unzip("SLDU/2010/tl_2010_#{state_code_to_id(state)}_sldu10.zip")
        return process_find(shp_file_path, "NAMELSAD10", state, name)      
      end

      # @return [Array] all state's upper legislative districts
      def self.find_all(state)
        find(state)       
      end
    end
    
    class Lower < StateLegislative
      # @return [Concensus::Resource] matched state lower legislative district
      def self.find(state, name = nil)
        shp_file_path = get_and_unzip("SLDL/2010/tl_2010_#{state_code_to_id(state)}_sldl10.zip")
        return process_find(shp_file_path, "NAMELSAD10", state, name)      
      end

      # @return [Array] all state's lower legislative district
      def self.find_all(state)
        find(state)       
      end      
    end
    
  end
end