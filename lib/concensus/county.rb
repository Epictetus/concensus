module Concensus
  class County < Resource
  
    finder_by_state "COUNTY/2010/tl_2010_\#{state_code_to_id(state)}_county10.zip", "NAME10"
    
  end
end