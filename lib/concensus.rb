require "concensus/configuration"
require "concensus/resource"
require "concensus/version"

require "concensus/congressional"
require "concensus/county"
require "concensus/place"
require "concensus/school"
require "concensus/state"
require "concensus/state_legislative"
require "concensus/zipcode"

require "geo_ruby/simple_features"
require "zip/zip"

module Concensus
  class ConcensusError < StandardError; end

  class ShapeNotFound < ConcensusError; end
  
  class YearNotSupported < ConcensusError; end
  
  class NoResourceForYear < ConcensusError; end 
end

