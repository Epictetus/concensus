require 'concensus'

describe Concensus do
  describe "states" do
    
    it "should be able to find a state" do
      Concensus::State.find("CA").should be_instance_of(Concensus::Resource)
    end  
    
  end
end