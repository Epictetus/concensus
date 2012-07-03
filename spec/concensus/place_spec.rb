require 'concensus'

describe Concensus do
  describe "places" do
    
    describe "2010" do
      before { Concensus::configuration.year = 2010 }
      
      it "should be able to find all places for a state" do
        Concensus::Place.find_all("CA").should be_instance_of(Array)
      end

      it "should be able to find one places for a state" do
        Concensus::Place.find("CA", "Berkeley").should be_instance_of(Concensus::Place)
      end
    end
    
    describe "2011" do
      before { Concensus::configuration.year = 2011 }
      
      it "should be able to find all places for a state" do
        Concensus::Place.find_all("CA").should be_instance_of(Array)
      end

      it "should be able to find one places for a state" do
        Concensus::Place.find("CA", "Berkeley").should be_instance_of(Concensus::Place)
      end
    end
    
  end
end