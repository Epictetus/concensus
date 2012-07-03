require 'concensus'

describe Concensus do
  describe "congressional districts" do
  
    it "should be able to find a congressional district district for a state" do
      Concensus::Congressional.find("CA", "13").should be_instance_of(Concensus::Congressional)
    end

    it "should be able to find all upper legislative districts for a state" do
      Concensus::Congressional.find_all("CA").should be_instance_of(Array)
    end
    
  end
end