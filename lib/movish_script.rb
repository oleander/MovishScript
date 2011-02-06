# encoding: utf-8

# Status codes
  # 1 - Empty arguments
  # 2 - No movie found
  # 3 - No subtitle found
  # 4 - Subtitle deactivated
  # 5 - Unpacking success
  # 6 - Unpacking failed

require 'unpack'
require 'ruby-growl'
require 'movie_searcher'
require 'undertexter'
require 'yaml'

class MovishScript
  attr_accessor :file, :config, :imdb_movie, :files
  
  def initialize(args = {})
    @growl  = Growl.new("localhost", "ruby-growl", ["ruby-growl Notification"])
    @file   = File.expand_path(args[:config] || "lib/movish_script/config.yaml")
    @config = YAML::load(File.read(@file))
  end
  
  def self.run(args)
    dir, file = args[:dir], args[:file] 

    this = MovishScript.new(args); @status = []; full_path = "#{dir}/#{file}"
    
    # If no arguments a being passed or deactivated
    return 1 if dir.nil? or file.nil? or dir.empty? or file.empty? or not this.config[:system][:active]
    
    this.growl("Movish", "Vänta...", :init)
    
    # The absolute path to the download
    path = File.directory?(full_path) ? full_path : File.dirname(full_path)
    
    # Unpacks the movie
    @status.push this.unpack(:full_path => full_path, :file => file)
    
    # Gets some info about the movie
    @status.push this.movie(:full_path => full_path, :file => file)
    
    # Downloads the subtitle
    @status.push this.subtitle(:file => file, :path => path) if this.imdb_movie
  end
  
  # Returns the status code for the operation
  def self.status; @status ||= []; end
  
  # Writes to the config file
  def self.config(args)
    return if args[:write].nil?
    
    this = MovishScript.new(args[:options] || {})
    args[:write].each do |attr, value|
      
      # Skipping this loop if the ingoing params is wrong
      next unless attr.match(/[a-z]*\.[a-z]*/i)
      first_key = attr.split('.').first.to_sym
      last_key = attr.split('.').last.to_sym
      
      # If the config does not exist, then we will create one
      this.config[first_key] = {} unless this.config.keys.include?(first_key)
      this.config[first_key][last_key] = {} unless this.config[first_key].keys.include?(last_key)
      
      this.config[first_key][last_key] = value
    end
    
    file = File.new(this.file, 'w+')
    file.write(this.config.to_yaml)
    file.close
  end
  
  # Sends a message using growl
  def growl(title, body, type)
    @growl.notify("ruby-growl Notification", title, body) if @config[:growl][:global] and @config[:growl][type]
  end
  
  # Downloads the subtitle
  # Ingoing arguments
    # file The name of the download, {Solsidan.S02E03.SWEDiSH.WEBRiP.XviD-PageDown} for example
    # movie The movie returned from {MovieSearcher}
    # path The path to the download
  def subtitle(args)
    # If no movie is found, we quit
    return 4 unless self.config[:subtitle][:active]
    
    file, movie, path = args[:file], self.imdb_movie, args[:path]
    
    subtitle = Undertexter.find(movie.imdb_id, self.config[:subtitle]).based_on(file)
    
    # Avbryter om vi inte hittade nagon undertext
    if subtitle.nil?
      self.growl("Ingen undertext hittades", movie.title, :subtitle); return 3
    end
    
    # Laddar ner undertexten
    sub_file = subtitle.download!

    # Packar upp undertexten och skickar och skickar innehallet till den nerladdade mappen
    Unpack.it!(:file => sub_file, :to => path) unless sub_file.nil?

    # Meddelar anvandaren att allt gick bra
    self.growl("Undertext hittades", subtitle.title, :subtitle)
  end
  
  # Unpacks the download movie
  # Ingoing arguments
    # full_path The absolut path to the download
    # title The title of the downloaded movie
  def unpack(args)
    full_path, file = args[:full_path], args[:file]
    
    # Is unpack activated?
    if self.config[:unpack][:active]
      self.files = File.directory?(full_path) ? Unpack.runner!(full_path, self.config[:unpack]) : []
    else
      self.files = []
    end
    
    if files.any?
      self.growl("Uppackat!", file, :unpack); return 5
    else
      return 6
    end
  end
  
  # Downloads some info from IMDB using {MovieSearcher}
  # Ingoing arguments
    # full_path The full path to download
    # file The name of the download
  def movie(args)
    full_path, file = args[:full_path], args[:file]
    
    # Hamtar filmen fran IMDB
    movie = MovieSearcher.find_by_download(full_path)
    
    # Avbryter om vi inte hittade nagon film
    if movie.nil?
      self.growl("Inget hittades",  file, :movie); return 2
    else
      self.imdb_movie = movie
    end
  end
end