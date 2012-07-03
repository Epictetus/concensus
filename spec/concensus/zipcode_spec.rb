require 'concensus'

describe Concensus do
  describe "zipcodes" do
    
    describe "2010" do
      before { Concensus::configuration.year = 2010 }
      
      it "should be able to find all zipcodes for a state" do
        Concensus::Zipcode.find_all("CO").should be_instance_of(Array)
      end

      it "should be able to find one zipcode for a state" do
        Concensus::Zipcode.find("CO", "80022").should be_instance_of(Concensus::Zipcode)
      end
    end
    
  end
end