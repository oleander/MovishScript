# encoding: UTF-8

require 'unpack'
require 'ruby-growl'
require 'movie_searcher'
require 'undertexter'

# Dir["#{File.expand_path('../vendor/cache', __FILE__)}/**"].map { |dir| File.directory?(lib = "#{dir}/lib") ? lib : dir }.each do |folder|
#   $LOAD_PATH.unshift(folder)
# end

module MovishScript
  def self.run(name, dir)
    # gem install unpack ruby-growl movie_searcher undertexter

    # Om inga parametrar skickades med så gör vi inget
    abort if dir.nil? or name.nil?

    growl = Growl.new("localhost", "ruby-growl", ["ruby-growl Notification"])
    growl.notify("ruby-growl Notification", "Movish", "Vänta...")

    # Hela länkvägen till filen som laddades hem
    full_path = "#{dir}/#{name}"

    # Absoluta länk-vägen till filen/mappen
    path = File.directory?(full_path) ? full_path : File.dirname(full_path)

    # Titlen på den nerladdade filen/mappen
    title = name

    # Packar upp filerna, såvida det var en mapp vi laddade hem
    files = File.directory?(full_path) ? Unpack.runner!(full_path) : []

    # Meddelar användaren om att nerladdningen är uppackad, om något fanns att packa upp
    growl.notify("ruby-growl Notification", "Uppackat!", title) if files.any?

    # Hämtar filmen från IMDB
    movie = MovieSearcher.find_by_download(full_path)

    # Avbryter om vi inte hittade någon film
    if movie.nil?
      growl.notify("ruby-growl Notification", "Inget hittades",  title); abort
    end

    # Hämtar undertexten
    subtitle = Undertexter.find(movie.imdb_id).based_on(title)

    # Avbryter om vi inte hittade någon undertext
    if subtitle.nil?
      growl.notify("ruby-growl Notification", "Ingen undertext hittades", movie.title); abort
    end

    # Laddar ner undertexten
    file = subtitle.download!

    # Packar upp undertexten och skickar och skickar innehållet till den nerladdade mappen
    Unpack.it!(file: file, to: path) unless file.nil?

    # Meddelar användaren att allt gick bra
    growl.notify("ruby-growl Notification", "Undertext hittades", subtitle.title)
  end
end
