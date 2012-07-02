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
  
  describe "it should find correct polygons" do
    before { Concensus::configuration.year = 2010 }
    
    it "should find correct the polygon for berkeley" do
      berkeley = GeoRuby::SimpleFeatures::Point.from_x_y(-122.2728, 37.8717)
      not_berkeley = GeoRuby::SimpleFeatures::Point.from_x_y(-122.2728, 30.8717)
      Concensus::Place.find("CA", "Berkeley").geometry.contains_point?(berkeley).should be_true
      Concensus::Place.find("CA", "Berkeley").geometry.contains_point?(not_berkeley).should be_false
    end
    
    it "should find correct the polygon for santa cruz" do
      santa_cruz = GeoRuby::SimpleFeatures::Point.from_x_y(-122.0297, 36.9742)
      not_santa_cruz = GeoRuby::SimpleFeatures::Point.from_x_y(-125.0297, 36.9742)
      Concensus::Place.find("CA", "Santa Cruz").geometry.contains_point?(santa_cruz).should be_true
      Concensus::Place.find("CA", "Santa Cruz").geometry.contains_point?(not_santa_cruz).should be_false
    end
  end
  
  describe "basic functionality" do
    before { Concensus::configuration.year = 2010 }
    
    it "should be able to find all places for a state" do
      Concensus::Place.find_all("CA").should be_instance_of(Array)
    end

    it "should be able to find one places for a state" do
      Concensus::Place.find("CA", "Berkeley").should be_instance_of(Concensus::Resource)
    end

    it "should be able to find all counties for a state" do
      Concensus::County.find_all("CA").should be_instance_of(Array)
    end

    it "should be able to find one county for a state" do
      Concensus::County.find("CA", "Alameda").should be_instance_of(Concensus::Resource)
    end

    it "should be able to find a state" do
      Concensus::State.find("CA").should be_instance_of(Concensus::Resource)
    end    
  end
   
end