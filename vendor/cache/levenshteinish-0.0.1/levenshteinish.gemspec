# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "levenshteinish/version"

Gem::Specification.new do |s|
  s.name        = "levenshteinish"
  s.version     = Levenshteinish::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Linus Oleander"]
  s.email       = ["linus@oleander.nu"]
  s.homepage    = ""
  s.summary     = %q{An implementation of levenshteinish}
  s.description = %q{An basic implementation of levenshteinish}

  s.rubyforge_project = "levenshteinish"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('hintable_levenshtein')
  s.add_development_dependency('rspec')
end
