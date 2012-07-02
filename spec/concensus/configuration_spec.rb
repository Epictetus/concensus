require 'concensus'

describe Concensus do
  
  # it "test interactively" do
  #   p Concensus::Place.find("CA", "Berkeley").geometry.to_json
  # end

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
   
end