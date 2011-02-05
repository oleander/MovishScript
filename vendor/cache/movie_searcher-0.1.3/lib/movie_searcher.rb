require "imdb_party"
require 'levenshteinish'
require 'mimer_plus'
class MovieSearcher
  attr_accessor :options, :cleaners
  
  def initialize(args)
    args.keys.each { |name| instance_variable_set "@" + name.to_s, args[name] unless name == :options }
    
    @options = {
      :long => 15,
      :split => /\s+|\./,
      :imdb => ImdbParty::Imdb.new,
      :limit => 0.4
    }
    
    @options.merge!(args[:options]) unless args[:options].nil?
    
    @cleaners = YAML.load(File.read("#{File.dirname(__FILE__)}/imdb_party/exclude.yaml"))["excluded"]
  end
  
  # Finds the movie based on the release name of the movie
  def self.find_by_release_name(search_value, options = {})
    this = MovieSearcher.new(options.merge(:search_value => search_value.to_s))
    return if this.to_long?
    
    movie = this.find_the_movie!
    return if movie.nil?
    
    # If the user wants for information about the movie, the {options[:details]} option should be true
    this.options[:details] ? self.find_movie_by_id(movie.imdb_id) : movie
  end
  
  # Finds the movie based on the nfo file (or similar file)
  def self.find_by_file(file_path)
    data = File.read(file_path)
    
    # If the file is encoded in something non valid (according to ruby), then it can't be read here
    # The {valid_encoding} method is not included in ruby 1.8.7, that's why i'm using {respond_to?}
    # More info here: http://blog.grayproductions.net/articles/ruby_19s_string
    # If the user uses 1.8.7 and the string isn't encoded in UTF-8, nothing happens.
    # The script won't throw an exception as it does in 1.9.2
    return if data.respond_to?(:valid_encoding?) and not data.valid_encoding?
      
    if data =~ /imdb\.com\/title\/(tt\d+)/
      return self.find_movie_by_id($1)
    end
  end
  
  # Finds the movie based on the folder
  def self.find_by_folder(folder_path)
    
    # Relative path?
    folder_path = self.relative?(folder_path)
    
    # Makes sure that every directory looks the same, an raises an exception if the dir does not exist
    folder_path = Dir.new(folder_path).path
    
    %x{cd '#{folder_path}' && find '#{folder_path}' -maxdepth 4}.split(/\n/).each do |file|
      # Locating every textfile in the directory
      # We're hoping to find a nfo file
      if Mimer.identify(file).text?
        result = self.find_by_file(file)
        return result unless result.nil?
      end
    end
    
    # Last resort, we hope that the folder contain the release name
    return self.find_by_release_name(File.split(folder_path).last)
  end
  
  # Try to figure out what method to use, folder or file
  def self.find_by_download(unknown)
    unknown = self.relative?(unknown)
    File.directory?(unknown) ? self.find_by_folder(unknown) : self.find_by_release_name(File.split(unknown).last)
  end
  
  # Returns the full path of the file/folder
  def self.relative?(unknown)
    unknown.match(/^\//) ? unknown : File.expand_path(unknown) 
  end
  
  def to_long?
    @split = self.cleaner(@search_value).split(@options[:split])    
    @split.length > @options[:long]
  end
  
  def find_the_movie!
    current =  @split.length
    
    until current <= 0 do
      title = @split.take(current).join(' ')      
      movies = @options[:imdb].find_by_title(title)
      break if movies.any? and movies.reject{ |movie| self.shortest(movie, title).nil? }.any?
      current -= 1 
    end
    
    return if movies.nil? or not movies.any?

    movie = movies.map do |movie| 
      [movie, self.shortest(movie, title)]
    end.reject do |value|
      value.last.nil?
    end.sort_by do |_,value|
      value
    end.first
    
    return if movie.nil?
    
    ImdbParty::Movie.new(movie.first)
  end
  
  def self.method_missing(method, *args, &block)  
    result = ImdbParty::Imdb.new.send(method, *args)
    result.class == Array ? result.map{|r| ImdbParty::Movie.new(r)} : result
  end
  
  def cleaner(string)
    @cleaners.each do |clean|
      string = string.gsub(/#{clean}/i, ' ')
    end
    
    [/(19|20\d{2})/, /\./, /\s*-\s*/, /\s{2,}/].each do |regex|
      string = string.gsub(regex, ' ')
    end
    
    string.strip
  end
  
  def shortest(a,b)
    # If the release contains a year, then the corresponding movie from IMDB should have the same year
    if year = @search_value.match(/(19|20\d{2})/)
      return nil unless year[1] == a[:year]
    end
     
    Levenshtein.distance(self.super_cleaner(a[:title]), self.super_cleaner(self.cleaner(b)), @options[:limit])
  end
  
  def super_cleaner(string)
    string.gsub(/[^a-z0-9]/i, '')
  end
end