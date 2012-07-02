require "rgeo/geo_json"

module RGeo
  module Geos
    class MultiPolygonImpl
      def to_json
        RGeo::GeoJSON.encode(self)
      end
      
      def contains_point?(x, y)
        factory = ::RGeo::Cartesian.preferred_factory()
        self.contains?(factory.point(x, y))
      end
    end
  end
end