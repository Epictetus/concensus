module Concensus
  class StateLegislative < Resource
    
    class Upper < StateLegislative
      finder_by_state "SLDU/2010/tl_2010_\#{state_code_to_id(state)}_sldu10.zip", "NAMELSAD10"
    end
    
    class Lower < StateLegislative
      finder_by_state "SLDL/2010/tl_2010_\#{state_code_to_id(state)}_sldl10.zip", "NAMELSAD10"
    end
    
  end
end