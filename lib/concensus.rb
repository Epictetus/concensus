require "concensus/version"
require "concensus/configuration"
require "concensus/resource"
require "concensus/place"
require "concensus/county"
require "concensus/state"
require "concensus/state_legislative"
require "concensus/congressional"
require "concensus/school"
require "geo_ruby/simple_features"
require "zip/zip"

module Concensus
  class ConcensusError < StandardError; end

  class ShapeNotFound < ConcensusError; end
  
  class YearNotSupported < ConcensusError; end 
end

