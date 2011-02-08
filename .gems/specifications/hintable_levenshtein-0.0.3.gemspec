# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hintable_levenshtein}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Hull"]
  s.date = %q{2010-04-29}
  s.description = %q{Levenshtein with hints}
  s.email = %q{joshbuddy@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "VERSION", "lib/hintable_levenshtein.rb", "lib/hintable_levenshtein/event.rb", "lib/hintable_levenshtein/rule_set.rb", "spec/hl_spec.rb", "spec/spec.opts"]
  s.homepage = %q{http://github.com/joshbuddy/hintable_levenshtein}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{joshbuddy-hintable_levenshtein}
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Levenshtein with hints}
  s.test_files = ["spec/hl_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
