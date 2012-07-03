module Concensus
  class Congressional < Resource
    
    finder_by_state "CD/111/tl_2010_\#{state_code_to_id(state)}_cd111.zip", "NAMELSAD10"

  end
end