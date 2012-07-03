module Concensus
  class Place < Resource
  
    finder_by_state "PLACE/2010/tl_2010_\#{state_code_to_id(state)}_place10.zip", "NAME10"
    
  end
end