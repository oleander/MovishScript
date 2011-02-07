task :build do
  Gem.path.each do |gem_path|
    break if system "gem install unpack ruby-growl movie_searcher undertexter daemons --install-dir '#{gem_path}'"
  end
end

