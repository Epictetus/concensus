module Concensus
  class Configuration
    attr_accessor :year
    attr_accessor :tmp_dir
    
    def root_url
      "http://www2.census.gov/geo/tiger/TIGER#{@year}/"
    end

    def initialize
      @year = 2010
      @tmp_dir = "tmp/"
    end
  end

  class << self
    attr_accessor :configuration
    
    def configuration
      @configuration = Configuration.new if @configuration.nil?
      @configuration
    end
  end

  def self.configure
    yield(configuration)
  end
end
