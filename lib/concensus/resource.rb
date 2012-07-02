require "zip/zip"
require "rgeo/shapefile"

module Concensus  
  class Resource
    
    attr_accessor :geometry, :name, :state, :year
      
    def initialize(name, geometry, state)
      @name = name
      @geometry = geometry
      @state = state
      @year = Concensus::configuration.year
    end
    
    def self.get_and_unzip(uri)
      safe_filename = uri.gsub("/", "_").gsub(".zip", "")
      zipped_file_path = "#{Concensus::configuration.tmp_dir}#{safe_filename}.zip"
      
      if !File.exists?(zipped_file_path)
        zipped_file = File.new(zipped_file_path, "wb")
        ext_file = open(Concensus::configuration.root_url + uri)
        zipped_file.write(ext_file.read)
      end
      
      if !already_unzipped?(zipped_file_path)
        unzipped_files = Zip::ZipFile.open(zipped_file_path)
      
        unzipped_files.each do |x|
          file = File.new(Concensus::configuration.tmp_dir + safe_filename + file_extension(x.to_s), "wb")
          file.write(x.get_input_stream.read)
          file.close
        end
      end
      
      return "#{Concensus::configuration.tmp_dir}#{safe_filename}.shp"
    end

    def self.process_find(shp_file_path, identifier, state, name = nil)
      
      if name
        RGeo::Shapefile::Reader.open(shp_file_path) do |shp|
          matched_shape = nil
          shp.each do |x|
            if x.attributes[identifier].match(name)
              matched_shape = x
              break
            end
          end
          raise StandardError if !matched_shape
          return Resource.new(matched_shape.attributes[identifier], matched_shape.geometry, state)
        end
      else
        places = []
        RGeo::Shapefile::Reader.open(shp_file_path).each do |shp|
          places << Resource.new(shp.attributes[identifier], shp.geometry, state)
        end
        return places
      end
      
    end

    def self.state_code_to_id(state_code)
      Concensus::configuration.census_state_ids[state_code]
    end
    
    def self.already_unzipped?(zipped_file_path)
      file_path_without_extension = filename_without_extension(zipped_file_path)
      File.exists?("#{file_path_without_extension}.shp") &&
      File.exists?("#{file_path_without_extension}.dbf") &&
      File.exists?("#{file_path_without_extension}.shx")
    end
    
    def self.filename_without_extension(filename)
      filename.gsub(/\.[a-z]*$/, "")
    end
    
    def self.file_extension(filename)
      filename[/\.[a-z]*$/]
    end
    
  end
end