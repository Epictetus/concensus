require 'concensus'

describe Concensus do

  describe "years" do
    
    after { Concensus::configuration.year = 2010 }
    
    it "should throw an error when a state is requested for 2011" do
      expect do
        Concensus::configuration.year = 2011
        Concensus::State.find("CA")
      end.to raise_error Concensus::NoResourceForYear
    end
    
    it "should throw an error when a county is requested for 2011" do
      expect do
        Concensus::configuration.year = 2011
        Concensus::County.find("CA")
      end.to raise_error Concensus::NoResourceForYear
    end
    
    it "should throw an error when a elementary school district is requested for 2011" do
      expect do
        Concensus::configuration.year = 2011
        Concensus::School::Elementary.find("CA")
      end.to raise_error Concensus::NoResourceForYear
    end
    
    it "should throw an error when a secondary school district is requested for 2011" do
      expect do
        Concensus::configuration.year = 2011
        Concensus::School::Secondary.find("CA")
      end.to raise_error Concensus::NoResourceForYear
    end
    
    it "should throw an error when a unified school district is requested for 2011" do
      expect do
        Concensus::configuration.year = 2011
        Concensus::School::Unified.find("CA")
      end.to raise_error Concensus::NoResourceForYear
    end
    
    it "should throw an error when a congressional district is requested for 2011" do
      expect do
        Concensus::configuration.year = 2011
        Concensus::Congressional.find("CA")
      end.to raise_error Concensus::NoResourceForYear
    end
    
  end
  
end