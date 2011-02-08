# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'movish_script/version'

Gem::Specification.new do |s|
  s.name        = "movish_script"
  s.version     = Version::CURRENT
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Linus Oleander"]
  s.email       = ["linus@oleander.nu"]
  s.homepage    = "https://github.com/oleander/MovishScript"
  s.summary     = %q{A Transmission callback that unpacks the downloaded item, renames it and downloads the appropriate subtitle}
  s.description = %q{An implementation of the gems undertexter, movie_searcher amd unpack}

  s.rubyforge_project = "movish_script"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('unpack')
  s.add_dependency('ruby-growl')
  s.add_dependency('movie_searcher')
  s.add_dependency('undertexter')
  s.add_dependency('daemons')
  
  s.add_development_dependency('rspec')
end
