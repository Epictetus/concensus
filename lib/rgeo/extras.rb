require "rgeo/geo_json"

module RGeo
  module Geos
    class MultiPolygonImpl
      def to_json
        coordinate_array = RGeo::GeoJSON.encode(self)["coordinates"]
        
        # Remove funky nested arrays
        0.upto(coordinate_array.count - 1) do |i|
          coordinate_array[i] = coordinate_array[i][0]
        end
        
        ActiveSupport::JSON.encode(coordinate_array)
      end
      
      def to_array
        coordinate_array = RGeo::GeoJSON.encode(self)["coordinates"]
        
        # Remove funky nested arrays
        0.upto(coordinate_array.count - 1) do |i|
          coordinate_array[i] = coordinate_array[i][0]
        end
        
        coordinate_array
      end
      
      def contains_point?(x, y)
        factory = ::RGeo::Cartesian.preferred_factory()
        self.contains?(factory.point(x, y))
      end
    end
  end
end