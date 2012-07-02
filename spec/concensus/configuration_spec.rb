require 'concensus'

describe Concensus do
  
   #it "test interactively" do
   #  p Concensus::Place.find("CA", "Berkeley").geometry
   #end

  describe "configuration" do
    it "should have a root url" do
      Concensus::configuration.root_url.should_not be_empty
    end
    
    describe "should be able to manually set the tmp file" do
      before { Concensus::configuration.tmp_dir = "tmp/concensustest/" }
      after do
        Dir::unlink(Concensus::configuration.tmp_dir)
        Concensus::configuration.tmp_dir = Concensus::configuration.default_tmp_dir
      end
      
      it "should create the new temp dir" do
        File.directory?("tmp/concensustest/").should == true
      end
    end
    
    it "default year should be 2010" do
      Concensus::configuration.year.should == 2010
    end
    
    describe "should be able to manually set the year" do
      before { Concensus::configuration.year = 2000 }
      after { Concensus::configuration.year = 2010 }
      
      it "should be updated" do
        Concensus::configuration.year.should == 2000
        Concensus::configuration.root_url.should match(/2000/)
      end
    end
  end  
   
end