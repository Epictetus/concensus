require 'concensus'

describe Concensus do
  describe "school districts" do
    
    describe "2011" do
      before { Concensus::configuration.year = 2011 }
      
      describe "elementary" do
        it "should be able to find an elementary school district for a state" do
          Concensus::School::Elementary.find("AZ", "San Fernando").should be_instance_of(Concensus::Resource)
        end

        it "should be able to find all elementary school districts for a state" do
          Concensus::School::Elementary.find_all("AZ").should be_instance_of(Array)
        end
      end

      describe "secondary" do
        it "should be able to find a secondary school district for a state" do
          Concensus::School::Secondary.find("AZ", "Tempe Union").should be_instance_of(Concensus::Resource)
        end

        it "should be able to find all secondary school districts for a state" do
          Concensus::School::Secondary.find_all("AZ").should be_instance_of(Array)
        end
      end

      describe "unified" do
        it "should be able to find a unified school district for a state" do
          Concensus::School::Unified.find("AZ", "Chandler").should be_instance_of(Concensus::Resource)
        end

        it "should be able to find all unified school districts for a state" do
          Concensus::School::Unified.find_all("AZ").should be_instance_of(Array)
        end
      end
    end
    
    describe "2010" do
      before { Concensus::configuration.year = 2010 }
      
      describe "elementary" do
        it "should be able to find an elementary school district for a state" do
          Concensus::School::Elementary.find("AZ", "San Fernando").should be_instance_of(Concensus::Resource)
        end

        it "should be able to find all elementary school districts for a state" do
          Concensus::School::Elementary.find_all("AZ").should be_instance_of(Array)
        end
      end

      describe "secondary" do
        it "should be able to find a secondary school district for a state" do
          Concensus::School::Secondary.find("AZ", "Tempe Union").should be_instance_of(Concensus::Resource)
        end

        it "should be able to find all secondary school districts for a state" do
          Concensus::School::Secondary.find_all("AZ").should be_instance_of(Array)
        end
      end

      describe "unified" do
        it "should be able to find a unified school district for a state" do
          Concensus::School::Unified.find("AZ", "Chandler").should be_instance_of(Concensus::Resource)
        end

        it "should be able to find all unified school districts for a state" do
          Concensus::School::Unified.find_all("AZ").should be_instance_of(Array)
        end
      end
    end
    
  end
end