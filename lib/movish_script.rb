Dir["#{File.expand_path('../../vendor/cache', __FILE__)}/**"].map { |dir| File.directory?(lib = "#{dir}/lib") ? lib : dir }.each do |folder|
  $:.unshift(folder)
end

require 'unpack'
require 'ruby-growl'
require 'movie_searcher'
require 'undertexter'

module MovishScript
  def self.run(name, dir)
    # gem install unpack ruby-growl movie_searcher undertexter

    # Om inga parametrar skickades med sa gor vi inget
    abort if dir.nil? or name.nil?

    growl = Growl.new("localhost", "ruby-growl", ["ruby-growl Notification"])
    growl.notify("ruby-growl Notification", "Movish", "Vanta...")

    # Hela lankvagen till filen som laddades hem
    full_path = "#{dir}/#{name}"

    # Absoluta lank-vagen till filen/mappen
    path = File.directory?(full_path) ? full_path : File.dirname(full_path)

    # Titlen pa den nerladdade filen/mappen
    title = name

    # Packar upp filerna, savida det var en mapp vi laddade hem
    files = File.directory?(full_path) ? Unpack.runner!(full_path) : []

    # Meddelar anvandaren om att nerladdningen ar uppackad, om nagot fanns att packa upp
    growl.notify("ruby-growl Notification", "Uppackat!", title) if files.any?

    # Hamtar filmen fran IMDB
    movie = MovieSearcher.find_by_download(full_path)

    # Avbryter om vi inte hittade nagon film
    if movie.nil?
      growl.notify("ruby-growl Notification", "Inget hittades",  title); abort
    end

    # Hamtar undertexten
    subtitle = Undertexter.find(movie.imdb_id).based_on(title)

    # Avbryter om vi inte hittade nagon undertext
    if subtitle.nil?
      growl.notify("ruby-growl Notification", "Ingen undertext hittades", movie.title); abort
    end

    # Laddar ner undertexten
    file = subtitle.download!

    # Packar upp undertexten och skickar och skickar innehallet till den nerladdade mappen
    Unpack.it!(:file => file, :to => path) unless file.nil?

    # Meddelar anvandaren att allt gick bra
    growl.notify("ruby-growl Notification", "Undertext hittades", subtitle.title)
  end
end
