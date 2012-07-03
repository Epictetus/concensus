# Monkeypatches GeoRuby to add a couple class methods. 
module GeoRuby
  module SimpleFeatures
    class MultiPolygon
      # A shortcut for grabbing an array of coordinates from GeoRuby's MultiPolygon.
      # @return [Array] an array of polygons, each one an array of coordinate pairs
      def to_array
        coord_array = self.as_json[:coordinates]
        
        ## Fixes weird, unnecessary extra array
        0.upto(coord_array.count - 1).each do |i|
          coord_array[i] = coord_array[i][0]
        end
        
        return coord_array
      end
      
      # @param [GeoRuby::SimpleFeatures::Point] GeoRuby Point object
      # @return [Boolean] true if any of the Polygon's shapes contain this point
      def contains_point?(point)
        self.each do |shape|
          return true if shape.contains_point?(point)
        end
        
        return false
      end
    end
  end
end