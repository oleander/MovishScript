# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "undertexter"
  s.version     = "0.1.4"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Linus Oleander"]
  s.email       = ["linus@oleander.nu"]
  s.homepage    = "https://github.com/oleander/Undertexter"
  s.summary     = %q{A subtitle search client for undertexter.se}
  s.description = %q{A subtitle search client to search for swedish subtitles on undertexter.se}

  s.rubyforge_project = "undertexter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('rest-client')
  
  # Using hpricot 0.8.2 due to a bug
  # https://github.com/hpricot/hpricot/issues/#issue/33
  
  s.add_dependency('hpricot', '0.8.2')
  s.add_dependency('mimer_plus')
  s.add_dependency('levenshteinish')
  s.add_development_dependency('rspec')
end
