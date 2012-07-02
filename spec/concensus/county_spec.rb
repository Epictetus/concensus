require 'concensus'

describe Concensus do
  describe "counties" do
    
    it "should be able to find all counties for a state" do
      Concensus::County.find_all("CA").should be_instance_of(Array)
    end

    it "should be able to find one county for a state" do
      Concensus::County.find("CA", "Alameda").should be_instance_of(Concensus::Resource)
    end
        
  end
end