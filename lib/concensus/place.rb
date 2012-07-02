module Concensus
  class Place < Resource
  
    def self.find(state, name)
      shp_file_path = get_shp_and_convert("PLACE/2010/tl_2010_01_place10.zip", "Ca10BlahBlah")
      return process_find(shp_file_path, state, name)      
    end
    
    def self.find_all(state)
      shp_file_path = get_shp_and_convert("PLACE/2010/tl_2010_01_place10.zip", "Ca10BlahBlah")
      return process_find(shp_file_path, state)        
    end
    
  end
end