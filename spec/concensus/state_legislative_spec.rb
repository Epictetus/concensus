require 'concensus'

describe Concensus do
  describe "state legislative districts" do
    
    describe "upper" do
      it "should be able to find an upper legislative district for a state" do
        Concensus::StateLegislative::Upper.find("CA", "13").should be_instance_of(Concensus::Resource)
      end

      it "should be able to find all upper legislative districts for a state" do
        Concensus::StateLegislative::Upper.find_all("CA").should be_instance_of(Array)
      end
    end
    
    describe "lower" do
      it "should be able to find a lower legislative district for a state" do
        Concensus::StateLegislative::Lower.find("CA", "13").should be_instance_of(Concensus::Resource)
      end

      it "should be able to find all lower legislative districts for a state" do
        Concensus::StateLegislative::Lower.find_all("CA").should be_instance_of(Array)
      end
    end
  end
end