module Concensus
  class School < Resource
    
    class Elementary < School
      finder_by_state "ELSD/2010/tl_2010_\#{state_code_to_id(state)}_elsd10.zip", "NAME10"
    end
    
    class Secondary < School
      finder_by_state "SCSD/2010/tl_2010_\#{state_code_to_id(state)}_scsd10.zip", "NAME10"
    end
    
    class Unified < School
      finder_by_state "UNSD/2010/tl_2010_\#{state_code_to_id(state)}_unsd10.zip", "NAME10"
    end
        
  end
end