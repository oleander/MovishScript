# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{levenshteinish}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Linus Oleander"]
  s.date = %q{2011-01-30}
  s.description = %q{An basic implementation of levenshteinish}
  s.email = ["linus@oleander.nu"]
  s.files = [".gitignore", ".rspec", "Gemfile", "Gemfile.lock", "Rakefile", "levenshteinish.gemspec", "lib/levenshteinish.rb", "lib/levenshteinish/version.rb", "spec/levenshteinish_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{levenshteinish}
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{An implementation of levenshteinish}
  s.test_files = ["spec/levenshteinish_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hintable_levenshtein>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<hintable_levenshtein>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<hintable_levenshtein>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
