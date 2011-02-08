# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{undertexter}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Linus Oleander"]
  s.date = %q{2011-02-06}
  s.description = %q{A subtitle search client to search for swedish subtitles on undertexter.se}
  s.email = ["linus@oleander.nu"]
  s.files = [".gitignore", ".rspec", "Gemfile", "Gemfile.lock", "README.markdown", "Rakefile", "lib/subtitle.rb", "lib/undertexter.rb", "lib/undertexter/array.rb", "spec/array_spec.rb", "spec/data/127.Hours.2010.DVDSCR.XViD-MC8", "spec/spec_helper.rb", "spec/subtitle_spec.rb", "spec/undertexter_spec.rb", "undertexter.gemspec"]
  s.homepage = %q{https://github.com/oleander/Undertexter}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{undertexter}
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{A subtitle search client for undertexter.se}
  s.test_files = ["spec/array_spec.rb", "spec/data/127.Hours.2010.DVDSCR.XViD-MC8", "spec/spec_helper.rb", "spec/subtitle_spec.rb", "spec/undertexter_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_runtime_dependency(%q<hpricot>, ["= 0.8.2"])
      s.add_runtime_dependency(%q<mimer_plus>, [">= 0"])
      s.add_runtime_dependency(%q<levenshteinish>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<hpricot>, ["= 0.8.2"])
      s.add_dependency(%q<mimer_plus>, [">= 0"])
      s.add_dependency(%q<levenshteinish>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<hpricot>, ["= 0.8.2"])
    s.add_dependency(%q<mimer_plus>, [">= 0"])
    s.add_dependency(%q<levenshteinish>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
