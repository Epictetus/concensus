require "httparty"
require "zip/zip"
require "geo_ruby"
require "geo_ruby/shp"

module Concensus  
  class Resource
    
    attr_accessor :geometry, :name, :state, :year
  
    include HTTParty
    
    def initialize(name, geometry, state)
      @name = name
      @geometry = geometry
      @state = state
      @year = Concensus::configuration.year
    end
    
    def self.get_and_unzip(uri, safe_filename)
      zipped_file_path = "#{Concensus::configuration.tmp_dir}/#{safe_filename}.zip"
      
      if !File.exists?(zipped_file_path)
        zipped_file = File.new(zipped_file_path, "w")
        zipped_file.write(HTTParty.get(Concensus::configuration.root_url + uri))
      end
      
      unzipped_files = Zip::ZipFile.open(zipped_file_path)
      
      unzipped_files.each do |x|
        file = File.new("#{Concensus::configuration.tmp_dir}#{x.to_s}", "w")
        file.write(x.get_input_stream.read)
        file.close
      end
      
      shp_file_name = unzipped_files.select { |x| x.to_s.match(/\.shp$/) }[0]
      
      return "#{Concensus::configuration.tmp_dir}#{shp_file_name}"
    end

    def self.process_find(shp_file_path, state, name = nil)
      
      # Prevent annoying georuby error messages
      previous_stderr, $stderr = $stderr, StringIO.new
      
      if name
        GeoRuby::Shp4r::ShpFile.open(shp_file_path) do |shp|
           matched_shape = shp.find {|x| x.data["NAME10"].match(name) }
           raise StandardError if !matched_shape
           return Resource.new(matched_shape.data["NAME10"], matched_shape.geometry, state)
        end
      else
        places = []
        GeoRuby::Shp4r::ShpFile.open(shp_file_path).each do |shp|
          places << Resource.new(shp.data["NAME10"], shp.geometry, state)
        end
        return places
      end
      
      # Restore previous value of stderr
      $stderr.string
      $stderr = previous_stderr
    end

    def self.state_code_to_id(state_code)
      Concensus::configuration.census_state_ids[state_code]
    end
    
  end
end