require 'concensus'

describe Concensus do

  describe "configuration" do
    it "should have a root url" do
      Concensus::configuration.root_url.should_not be_empty
    end
    
    it "default year should be 2010" do
      Concensus::configuration.year.should == 2010
    end
    
    describe "should be able to manually set the year" do
      before do
        Concensus::configuration.year = 2000
      end
      it "should be updated" do
        Concensus::configuration.year.should == 2000
        Concensus::configuration.root_url.should match(/2000/)
      end
    end
  end  
  
  it "test interactively" do
    p Concensus::Place.find("CA", "Berkeley").geometry.to_json[0]
  end
  
  #it "should be able to find all places for a state" do
  #  Concensus::Place.find_all("CA").should be_instance_of(Array)
  #end
  #
  #it "should be able to find one places for a state" do
  #  Concensus::Place.find("CA", "Berkeley").should be_instance_of(Concensus::Place)
  #end
  #
  #it "should be able to find all counties for a state" do
  #  Concensus::County.find_all("CA").should be_instance_of(Array)
  #end
  #
  #it "should be able to find one county for a state" do
  #  Concensus::County.find("CA", "Alameda").should be_instance_of(Concensus::Place)
  #end
  
 
end