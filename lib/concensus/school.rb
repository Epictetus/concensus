module Concensus
  class School < Resource
    
    class Elementary < School
      def self.find(state, name = nil)
        if Concensus::configuration.year == 2010
          attribute_key = "NAME10"
          shp_file_path = get_and_unzip("ELSD/2010/tl_2010_#{state_code_to_id(state)}_elsd10.zip")
        elsif Concensus::configuration.year == 2011
          attribute_key = "name"
          shp_file_path = get_and_unzip("ELSD/tl_2011_#{state_code_to_id(state)}_elsd.zip")
        end
        
        return process_find("School::Elementary", shp_file_path, attribute_key, state, name)  
      end

      def self.find_all(state)
        find(state)       
      end
    end
    
    class Secondary < School
      def self.find(state, name = nil)
        if Concensus::configuration.year == 2010
          attribute_key = "NAME10"
          shp_file_path = get_and_unzip("SCSD/2010/tl_2010_#{state_code_to_id(state)}_scsd10.zip")
        elsif Concensus::configuration.year == 2011
          attribute_key = "name"
          shp_file_path = get_and_unzip("SCSD/tl_2011_#{state_code_to_id(state)}_scsd.zip")
        end
        
        return process_find("School::Secondary", shp_file_path, attribute_key, state, name)  
      end

      def self.find_all(state)
        find(state)       
      end
    end
    
    class Unified < School
      def self.find(state, name = nil)
        if Concensus::configuration.year == 2010
          attribute_key = "NAME10"
          shp_file_path = get_and_unzip("UNSD/2010/tl_2010_#{state_code_to_id(state)}_unsd10.zip")
        elsif Concensus::configuration.year == 2011
          attribute_key = "name"
          shp_file_path = get_and_unzip("UNSD/tl_2011_#{state_code_to_id(state)}_unsd.zip")
        end
        
        return process_find("School::Unified", shp_file_path, attribute_key, state, name)  
      end

      def self.find_all(state)
        find(state)       
      end
    end
        
  end
end