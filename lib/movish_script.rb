# encoding: utf-8

# Status codes
  # 1 - Empty arguments
  # 2 - No movie found
  # 3 - No subtitle found


require 'unpack'
require 'ruby-growl'
require 'movie_searcher'
require 'undertexter'
require 'yaml'

class MovishScript
  attr_accessor :file, :config
  
  def initialize(args)
    @growl  = Growl.new("localhost", "ruby-growl", ["ruby-growl Notification"])
    @file   = File.expand_path(args[:config] || "lib/movish_script/config.yaml")
    @config = YAML::load(File.read(@file))
  end
  
  def growl(title, body, type)
    @growl.notify("ruby-growl Notification", title, body) if @config[:growl][:global] and @config[:growl][type]
  end
  
  def self.run(args)
    dir, name = args[:dir], args[:file] 
    # If no arguments a being passed, then we do nothing
    return 1 if dir.nil? or name.nil? or dir.empty? or name.empty?
    
    this = MovishScript.new(args)
    
    this.growl("Movish", "Vänta...", :init)

    # Hela lankvagen till filen som laddades hem
    full_path = "#{dir}/#{name}"

    # Absoluta lank-vagen till filen/mappen
    path = File.directory?(full_path) ? full_path : File.dirname(full_path)

    # Titlen pa den nerladdade filen/mappen
    title = name

    # Packar upp filerna, savida det var en mapp vi laddade hem
    files = File.directory?(full_path) ? Unpack.runner!(full_path) : []
    
    # Meddelar anvandaren om att nerladdningen ar uppackad, om nagot fanns att packa upp
    this.growl("Uppackat!", title, :unpack) if files.any?

    # Hamtar filmen fran IMDB
    movie = MovieSearcher.find_by_download(full_path)

    # Avbryter om vi inte hittade nagon film
    if movie.nil?
      this.growl("Inget hittades",  title, :movie); return 2
    end
    
    # Hamtar undertexten
    subtitle = Undertexter.find(movie.imdb_id).based_on(title)
    
    # Avbryter om vi inte hittade nagon undertext
    if subtitle.nil?
      this.growl("Ingen undertext hittades", movie.title, :movie); return 3
    end
    
    # Laddar ner undertexten
    file = subtitle.download!

    # Packar upp undertexten och skickar och skickar innehallet till den nerladdade mappen
    Unpack.it!(:file => file, :to => path) unless file.nil?

    # Meddelar anvandaren att allt gick bra
    this.growl("Undertext hittades", subtitle.title, :subtitle)
  end
  
  def self.config(args)
    this = MovishScript.new(args[:options])
    args[:write].each do |attr, value|
      this.config[attr.split('.').first.to_sym][attr.split('.').last.to_sym] = value
    end
    
    file = File.new(this.file, 'w+')
    file.write(this.config.to_yaml)
    file.close
  end
end