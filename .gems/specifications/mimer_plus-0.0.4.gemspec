# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mimer_plus}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Linus Oleander", "Ariejan de Vroom"]
  s.date = %q{2011-01-29}
  s.description = %q{Find the mime-type of a file using unix' `file` command. This does not look at file extension, ever...}
  s.email = ["linus@oleander.nu", "ariejan@ariejan.net"]
  s.files = [".document", ".gitignore", "Gemfile", "Gemfile.lock", "LICENSE", "README.rdoc", "Rakefile", "VERSION", "lib/mimer_plus.rb", "mimer_plus.gemspec", "spec/fixtures/facepalm.jpg", "spec/fixtures/google.gif", "spec/fixtures/kirk.png", "spec/fixtures/plain.txt", "spec/mimer_plus_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{https://github.com/oleander/mimer}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Find the mime-type of a file using unix' `file` command. This does not look at file extension, ever.}
  s.test_files = ["spec/fixtures/facepalm.jpg", "spec/fixtures/google.gif", "spec/fixtures/kirk.png", "spec/fixtures/plain.txt", "spec/mimer_plus_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
