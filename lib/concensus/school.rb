module Concensus
  class School < Resource
    
    class Elementary < School
      def self.find(state, name = nil)
        shp_file_path = get_and_unzip("ELSD/2010/tl_2010_#{state_code_to_id(state)}_elsd10.zip")
        return process_find(shp_file_path, "NAME10", state, name)      
      end

      def self.find_all(state)
        find(state)       
      end
    end
    
    class Secondary < School
      def self.find(state, name = nil)
        shp_file_path = get_and_unzip("SCSD/2010/tl_2010_#{state_code_to_id(state)}_scsd10.zip")
        return process_find(shp_file_path, "NAME10", state, name)      
      end

      def self.find_all(state)
        find(state)       
      end
    end
    
    class Unified < School
      def self.find(state, name = nil)
        shp_file_path = get_and_unzip("UNSD/2010/tl_2010_#{state_code_to_id(state)}_unsd10.zip")
        return process_find(shp_file_path, "NAME10", state, name)      
      end

      def self.find_all(state)
        find(state)       
      end
    end
        
  end
end