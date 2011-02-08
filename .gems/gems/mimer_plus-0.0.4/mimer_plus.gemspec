$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "mimer_plus"
  s.version     = "0.0.4"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Linus Oleander", "Ariejan de Vroom"]
  s.email       = ["linus@oleander.nu", "ariejan@ariejan.net"]
  s.homepage    = "https://github.com/oleander/mimer"
  s.summary     = %q{Find the mime-type of a file using unix' `file` command. This does not look at file extension, ever.}
  s.description = %q{Find the mime-type of a file using unix' `file` command. This does not look at file extension, ever...}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency('rspec')
end
