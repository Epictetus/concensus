require 'concensus'

describe Concensus do
  describe "accuracy" do
        
    it "should find correct the polygon for berkeley" do
      berkeley = [-122.2728, 37.8717]
      not_berkeley = [-122.2728, 30.8717]
      Concensus::Place.find("CA", "Berkeley").geometry.contains_point?(*berkeley).should be_true
      Concensus::Place.find("CA", "Berkeley").geometry.contains_point?(*not_berkeley).should be_false
    end
    
    it "should find correct the polygon for santa cruz" do
      santa_cruz = [-122.0297, 36.9742]
      not_santa_cruz = [-125.0297, 36.9742]
      Concensus::Place.find("CA", "Santa Cruz").geometry.contains_point?(*santa_cruz).should be_true
      Concensus::Place.find("CA", "Santa Cruz").geometry.contains_point?(*not_santa_cruz).should be_false
    end
    
  end
end