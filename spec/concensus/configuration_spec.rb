require 'concensus'

describe Concensus do

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
      before { Concensus::configuration.year = 2011 }
      after { Concensus::configuration.year = 2010 }
      
      it "should be updated" do
        Concensus::configuration.year.should == 2011
        Concensus::configuration.root_url.should match(/2011/)
      end
    end
    
    it "should raise error for not supported years" do
      expect do
        Concensus::configuration.year = 2000
      end.to raise_error(Concensus::YearNotSupported)
    end
    
    it "shouldn't have changed the year" do
      Concensus::configuration.year.should == 2010      
    end
  end  
   
end