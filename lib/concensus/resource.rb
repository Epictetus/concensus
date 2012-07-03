require "zip/zip"
require "geo_ruby"
require "geo_ruby/shp"
require "open-uri"

module Concensus  
  class Resource
    
    # @return [MultiPolygon] georuby geometry object
    attr_accessor :geometry
    
    # @return [String] this resource's name in the shpfile metadata    
    attr_accessor :name
    
    # @return [String] the state this resource belongs to, if applicable
    attr_accessor :state
    
    # @return [Fixnum] this resource's census year
    attr_accessor :year
      
    def initialize(name, geometry, state)
      @name = name
      @geometry = geometry
      @state = state
      @year = Concensus::configuration.year
    end
    
    # Checks for census zipfile in temporary storage. If not there, downloads it.
    # Then, checks for unzipped files in temporary storage. If not there, unzips the archive.
    #
    # @return [String] path to shpfile in temporary storage
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

    # Converts the shpfile to a georuby object.
    #
    # If we're searching for a specific region in the shpfile,
    # we find it by iterating over each region and matching
    # by metadata. We return the first one we find.
    # 
    # @return [Array] returns array if we're looking for mulitple regions
    # @return [Resource] returns resource if we're looking for a specific region
    def self.process_find(shp_file_path, identifier, state, name = nil)
      
      # Prevent annoying georuby error messages
      previous_stderr, $stderr = $stderr, StringIO.new
      
      if name
        GeoRuby::Shp4r::ShpFile.open(shp_file_path) do |shp|
          matched_shape = shp.find {|x| x.data[identifier].match(name) }
          raise StandardError if !matched_shape
          return Resource.new(matched_shape.data[identifier], matched_shape.geometry, state)
        end
      else
        places = []
        GeoRuby::Shp4r::ShpFile.open(shp_file_path).each do |shp|
          places << Resource.new(shp.data[identifier], shp.geometry, state)
        end
        return places
      end
      
      # Restore previous value of stderr
      $stderr.string
      $stderr = previous_stderr
      
    end

    # Converts a state code, like "CA", to the US Census Bureau's numerical identifier.
    # @param [String] two-letter state code
    # @return [Fixnum] numerical census state identifier
    def self.state_code_to_id(state_code)
      Concensus::configuration.census_state_ids[state_code]
    end
    
    # @return [Boolean] true if the zip's files are found in
    #   temporary storage
    def self.already_unzipped?(zipped_file_path)
      file_path_without_extension = filename_without_extension(zipped_file_path)
      File.exists?("#{file_path_without_extension}.shp") &&
      File.exists?("#{file_path_without_extension}.dbf") &&
      File.exists?("#{file_path_without_extension}.shx")
    end
    
    # @param [String] filename
    # @return [String]filename with the extension stripped.
    def self.filename_without_extension(filename)
      filename.gsub(/\.[a-z]*$/, "")
    end
  
    # @param [String] filename
    # @return [String] file's extension.    
    def self.file_extension(filename)
      filename[/\.[a-z]*$/]
    end
    
  end
end