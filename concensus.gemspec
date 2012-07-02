# -*- encoding: utf-8 -*-
require File.expand_path('../lib/concensus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["adamjacobbecker"]
  gem.email         = ["ad@mbecker.cc"]
  gem.description   = %q{"A small tool for reading United States Census TIGER/Line Shapefiles."}
  gem.summary       = %q{"Converts U.S. Census Shapes to RGeo format."}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "concensus"
  gem.require_paths = ["lib"]
  gem.version       = Concensus::VERSION
    
    
  gem.add_development_dependency "rspec"
  
  %w{rspec activesupport rubyzip rgeo rgeo-shapefile rgeo-geojson}.each do |x|
    gem.add_dependency x
  end
end
