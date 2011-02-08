# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{movie_searcher}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Linus Oleander", "Jon Maddox"]
  s.date = %q{2011-02-03}
  s.description = %q{IMDB client using the IMDB API that their iPhone app uses. It can also figure out what movie you are looking for just by looking at the release name of the movie}
  s.email = ["linus@oleander.nu", "jon@mustacheinc.com"]
  s.files = [".bundle/config", ".document", ".gitignore", ".rspec", "Gemfile", "Gemfile.lock", "LICENSE", "README.md", "Rakefile", "lib/imdb_party.rb", "lib/imdb_party/exclude.yaml", "lib/imdb_party/httparty_icebox.rb", "lib/imdb_party/imdb.rb", "lib/imdb_party/movie.rb", "lib/imdb_party/person.rb", "lib/movie_searcher.rb", "movie_searcher.gemspec", "spec/data/127 Hours 2010 WEBSCR XviD AC3-Rx/127.Hours.2010.DVDSCR.XViD-MC8.srt", "spec/data/127 Hours 2010 WEBSCR XviD AC3-Rx/Undertexter.se.nfo", "spec/data/127.Hours.2010.DVDSCR.AC3.XViD-T0XiC-iNK/127.Hours.2010.DVDSCR.AC3.XViD-T0XiC-iNK.nfo", "spec/data/its.kind.of.a.funny.story.2010.dvdrip.xvid-amiable.nfo", "spec/data/its.kind.of.a.funny.story.2010.dvdrip.xvid-amiable.nfo.bad", "spec/data/some_strange_name/127.Hours.2010.DVDSCR.AC3.XViD-T0XiC-iNK.nfo", "spec/data/some_strange_name/name_0", "spec/data/some_strange_name/name_1", "spec/data/some_strange_name/name_10", "spec/data/some_strange_name/name_11", "spec/data/some_strange_name/name_12", "spec/data/some_strange_name/name_13", "spec/data/some_strange_name/name_14", "spec/data/some_strange_name/name_2", "spec/data/some_strange_name/name_3", "spec/data/some_strange_name/name_4", "spec/data/some_strange_name/name_5", "spec/data/some_strange_name/name_6", "spec/data/some_strange_name/name_7", "spec/data/some_strange_name/name_8", "spec/data/some_strange_name/name_9", "spec/movie_searcher_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/oleander/MovieSearcher}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{IMDB client using the IMDB API that their iPhone app uses}
  s.test_files = ["spec/data/127 Hours 2010 WEBSCR XviD AC3-Rx/127.Hours.2010.DVDSCR.XViD-MC8.srt", "spec/data/127 Hours 2010 WEBSCR XviD AC3-Rx/Undertexter.se.nfo", "spec/data/127.Hours.2010.DVDSCR.AC3.XViD-T0XiC-iNK/127.Hours.2010.DVDSCR.AC3.XViD-T0XiC-iNK.nfo", "spec/data/its.kind.of.a.funny.story.2010.dvdrip.xvid-amiable.nfo", "spec/data/its.kind.of.a.funny.story.2010.dvdrip.xvid-amiable.nfo.bad", "spec/data/some_strange_name/127.Hours.2010.DVDSCR.AC3.XViD-T0XiC-iNK.nfo", "spec/data/some_strange_name/name_0", "spec/data/some_strange_name/name_1", "spec/data/some_strange_name/name_10", "spec/data/some_strange_name/name_11", "spec/data/some_strange_name/name_12", "spec/data/some_strange_name/name_13", "spec/data/some_strange_name/name_14", "spec/data/some_strange_name/name_2", "spec/data/some_strange_name/name_3", "spec/data/some_strange_name/name_4", "spec/data/some_strange_name/name_5", "spec/data/some_strange_name/name_6", "spec/data/some_strange_name/name_7", "spec/data/some_strange_name/name_8", "spec/data/some_strange_name/name_9", "spec/movie_searcher_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<levenshteinish>, [">= 0"])
      s.add_runtime_dependency(%q<mimer_plus>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<autotest-standalone>, [">= 0"])
      s.add_development_dependency(%q<autotest>, [">= 0"])
      s.add_development_dependency(%q<autotest-growl>, [">= 0"])
      s.add_development_dependency(%q<autotest-fsevent>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<levenshteinish>, [">= 0"])
      s.add_dependency(%q<mimer_plus>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<autotest-standalone>, [">= 0"])
      s.add_dependency(%q<autotest>, [">= 0"])
      s.add_dependency(%q<autotest-growl>, [">= 0"])
      s.add_dependency(%q<autotest-fsevent>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<levenshteinish>, [">= 0"])
    s.add_dependency(%q<mimer_plus>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<autotest-standalone>, [">= 0"])
    s.add_dependency(%q<autotest>, [">= 0"])
    s.add_dependency(%q<autotest-growl>, [">= 0"])
    s.add_dependency(%q<autotest-fsevent>, [">= 0"])
  end
end
