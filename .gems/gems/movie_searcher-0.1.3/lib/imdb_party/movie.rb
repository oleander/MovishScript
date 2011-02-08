module ImdbParty
  class Movie
    attr_accessor :imdb_id, :title, :directors, :writers, :tagline, :company, :plot, :runtime, :rating, :poster_url, :release_date, :certification, :genres, :actors, :trailers, :year

    def initialize(options={})
      if not options.nil? and options.keys.first.class == Symbol
        options.keys.each { |name| instance_variable_set "@" + name.to_s, options[name] }; return
      end
      
      @imdb_id = options["tconst"]
      @title = options["title"]
      @tagline = options["tagline"]
      @plot = options["plot"]["outline"] if options["plot"]
      @runtime = "#{(options["runtime"]["time"]/60).to_i} min" if options["runtime"]
      @rating = options["rating"]
      @poster_url = options["image"]["url"] if options["image"]
      @release_date = options["release_date"]["normal"] if options["release_date"] && options["release_date"]["normal"]
      @certification = options["certificate"]["certificate"] if options["certificate"] && options["certificate"]["certificate"]
      @genres = options["genres"] || []
      
      # Sometimes the @release_date object is a string instead of a date object
      if @release_date.class == String
        [{:regex => /^\d{4}-\d{2}$/, :concat => "-01"}, {:regex => /^\d{4}$/, :concat => "-01-01"}].each do |value|
          if @release_date.match(value[:regex])
            @release_date = Date.parse(@release_date << value[:concat]); break
          end
        end
      end
        
      # parse directors
      @directors = options["directors_summary"] ? options["directors_summary"].map { |d| Person.new(d) } : []

      # parse directors
      @writers = []
      @writers = options["writers_summary"] ? options["writers_summary"].map { |w| Person.new(w) } : []

      # parse actors
      @actors = []
      @actors = options["cast_summary"] ? options["cast_summary"].map { |a| Person.new(a) } : []

      #parse trailers
      @trailers = {}
      if options["trailer"] && options["trailer"]["encodings"]
        options["trailer"]["encodings"].each_pair do |k,v|
          @trailers[v["format"]] = v["url"]
        end
      end

    end
  end
end
