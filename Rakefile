task :default do
  gem_path = File.expand_path("../.gems", __FILE__)
  puts %x{mkdir -p '#{gem_path}'}
  puts %x{gem install unpack ruby-growl movie_searcher undertexter daemons --install-dir '#{gem_path}'}
end