require 'concensus'

describe Concensus do
  describe "places" do
    
    it "should be able to find all places for a state" do
      Concensus::Place.find_all("CA").should be_instance_of(Array)
    end

    it "should be able to find one places for a state" do
      Concensus::Place.find("CA", "Berkeley").should be_instance_of(Concensus::Resource)
    end
    
  end
end