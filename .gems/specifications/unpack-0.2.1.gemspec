# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{unpack}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Linus Oleander"]
  s.date = %q{2011-02-07}
  s.default_executable = %q{unrar}
  s.description = %q{An automated unpacking tool for *nix, using Ruby 1.9.2}
  s.email = ["linus@oleander.nu"]
  s.executables = ["unrar"]
  s.files = [".gitignore", ".rspec", "Gemfile", "README.markdown", "Rakefile", "bin/unrar", "lib/unpack.rb", "lib/unpack/container.rb", "spec/data/from/some_zip_files.zip", "spec/data/from/test_package.rar", "spec/data/o_files/some_zip_files.zip", "spec/data/o_files/test_package.rar", "spec/data/rar/110_accessible_.rar", "spec/data/rar/120_accessible_.rar", "spec/data/rar/167_accessible_.rar", "spec/data/rar/777_accessible_.rar", "spec/data/rar/918_accessible_.rar", "spec/data/rar/cd1/112_okey_.rar", "spec/data/rar/cd1/129_okey_.rar", "spec/data/rar/cd1/199_okey_.rar", "spec/data/rar/cd1/228_okey_.rar", "spec/data/rar/cd1/263_okey_.rar", "spec/data/rar/cd1/325_okey_.rar", "spec/data/rar/cd1/329_okey_.rar", "spec/data/rar/cd1/333_okey_.rar", "spec/data/rar/cd1/364_okey_.rar", "spec/data/rar/cd1/390_okey_.rar", "spec/data/rar/cd1/462_okey_.rar", "spec/data/rar/cd1/515_okey_.rar", "spec/data/rar/cd1/572_okey_.rar", "spec/data/rar/cd1/573_okey_.rar", "spec/data/rar/cd1/5_okey_.rar", "spec/data/rar/cd1/627_okey_.rar", "spec/data/rar/cd1/674_okey_.rar", "spec/data/rar/cd1/682_okey_.rar", "spec/data/rar/cd1/690_okey_.rar", "spec/data/rar/cd1/698_okey_.rar", "spec/data/rar/cd1/817_okey_.rar", "spec/data/rar/cd1/828_okey_.rar", "spec/data/rar/cd1/840_okey_.rar", "spec/data/rar/cd1/920_okey_.rar", "spec/data/rar/cd1/925_okey_.rar", "spec/data/rar/cd1/974_okey_.rar", "spec/data/rar/cd1/978_okey_.rar", "spec/data/rar/cd1/982_okey_.rar", "spec/data/rar/cd1/988_okey_.rar", "spec/data/rar/cd1/998_okey_.rar", "spec/data/rar/cd1/Unreachable/117_not_.rar", "spec/data/rar/cd1/Unreachable/12_not_.rar", "spec/data/rar/cd1/Unreachable/171_not_.rar", "spec/data/rar/cd1/Unreachable/178_not_.rar", "spec/data/rar/cd1/Unreachable/179_not_.rar", "spec/data/rar/cd1/Unreachable/202_not_.rar", "spec/data/rar/cd1/Unreachable/214_not_.rar", "spec/data/rar/cd1/Unreachable/423_not_.rar", "spec/data/rar/cd1/Unreachable/46_not_.rar", "spec/data/rar/cd1/Unreachable/477_not_.rar", "spec/data/rar/cd1/Unreachable/499_not_.rar", "spec/data/rar/cd1/Unreachable/531_not_.rar", "spec/data/rar/cd1/Unreachable/536_not_.rar", "spec/data/rar/cd1/Unreachable/554_not_.rar", "spec/data/rar/cd1/Unreachable/556_not_.rar", "spec/data/rar/cd1/Unreachable/564_not_.rar", "spec/data/rar/cd1/Unreachable/569_not_.rar", "spec/data/rar/cd1/Unreachable/608_not_.rar", "spec/data/rar/cd1/Unreachable/614_not_.rar", "spec/data/rar/cd1/Unreachable/634_not_.rar", "spec/data/rar/cd1/Unreachable/644_not_.rar", "spec/data/rar/cd1/Unreachable/708_not_.rar", "spec/data/rar/cd1/Unreachable/756_not_.rar", "spec/data/rar/cd1/Unreachable/802_not_.rar", "spec/data/rar/cd1/Unreachable/815_not_.rar", "spec/data/rar/cd1/Unreachable/833_not_.rar", "spec/data/rar/cd1/Unreachable/84_not_.rar", "spec/data/rar/cd1/Unreachable/92_not_.rar", "spec/data/rar/cd1/Unreachable/936_not_.rar", "spec/data/rar/cd1/Unreachable/939_not_.rar", "spec/data/rar/cd2/102_okey_without_.strange", "spec/data/rar/cd2/111_okey_without_.strange", "spec/data/rar/cd2/14_okey_without_.strange", "spec/data/rar/cd2/242_okey_without_.strange", "spec/data/rar/cd2/244_okey_without_.strange", "spec/data/rar/cd2/248_okey_without_.strange", "spec/data/rar/cd2/278_okey_without_.strange", "spec/data/rar/cd2/283_okey_without_.strange", "spec/data/rar/cd2/310_okey_without_.strange", "spec/data/rar/cd2/439_okey_without_.strange", "spec/data/rar/cd2/453_okey_without_.strange", "spec/data/rar/cd2/461_okey_without_.strange", "spec/data/rar/cd2/476_okey_without_.strange", "spec/data/rar/cd2/484_okey_without_.strange", "spec/data/rar/cd2/491_okey_without_.strange", "spec/data/rar/cd2/507_okey_without_.strange", "spec/data/rar/cd2/518_okey_without_.strange", "spec/data/rar/cd2/609_okey_without_.strange", "spec/data/rar/cd2/613_okey_without_.strange", "spec/data/rar/cd2/633_okey_without_.strange", "spec/data/rar/cd2/644_okey_without_.strange", "spec/data/rar/cd2/682_okey_without_.strange", "spec/data/rar/cd2/706_okey_without_.strange", "spec/data/rar/cd2/767_okey_without_.strange", "spec/data/rar/cd2/788_okey_without_.strange", "spec/data/rar/cd2/801_okey_without_.rar", "spec/data/rar/cd2/808_okey_without_.strange", "spec/data/rar/cd2/837_okey_without_.strange", "spec/data/rar/cd2/919_okey_without_.strange", "spec/data/rar/cd2/93_okey_without_.strange", "spec/data/rar/cd2/980_okey_without_.strange", "spec/data/rar/subdir/133_subtitle_.rar", "spec/data/rar/subdir/169_subtitle_.rar", "spec/data/rar/subdir/22_subtitle_.rar", "spec/data/rar/subdir/483_subtitle_.rar", "spec/data/rar/subdir/639_subtitle_.rar", "spec/data/rar_real/test_package.rar", "spec/data/zip_real/some_zip_files.zip", "spec/spec_helper.rb", "spec/unpack_spec.rb", "unpack.gemspec"]
  s.homepage = %q{https://github.com/oleander/Unpack}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{An automated unrar gem}
  s.test_files = ["spec/data/from/some_zip_files.zip", "spec/data/from/test_package.rar", "spec/data/o_files/some_zip_files.zip", "spec/data/o_files/test_package.rar", "spec/data/rar/110_accessible_.rar", "spec/data/rar/120_accessible_.rar", "spec/data/rar/167_accessible_.rar", "spec/data/rar/777_accessible_.rar", "spec/data/rar/918_accessible_.rar", "spec/data/rar/cd1/112_okey_.rar", "spec/data/rar/cd1/129_okey_.rar", "spec/data/rar/cd1/199_okey_.rar", "spec/data/rar/cd1/228_okey_.rar", "spec/data/rar/cd1/263_okey_.rar", "spec/data/rar/cd1/325_okey_.rar", "spec/data/rar/cd1/329_okey_.rar", "spec/data/rar/cd1/333_okey_.rar", "spec/data/rar/cd1/364_okey_.rar", "spec/data/rar/cd1/390_okey_.rar", "spec/data/rar/cd1/462_okey_.rar", "spec/data/rar/cd1/515_okey_.rar", "spec/data/rar/cd1/572_okey_.rar", "spec/data/rar/cd1/573_okey_.rar", "spec/data/rar/cd1/5_okey_.rar", "spec/data/rar/cd1/627_okey_.rar", "spec/data/rar/cd1/674_okey_.rar", "spec/data/rar/cd1/682_okey_.rar", "spec/data/rar/cd1/690_okey_.rar", "spec/data/rar/cd1/698_okey_.rar", "spec/data/rar/cd1/817_okey_.rar", "spec/data/rar/cd1/828_okey_.rar", "spec/data/rar/cd1/840_okey_.rar", "spec/data/rar/cd1/920_okey_.rar", "spec/data/rar/cd1/925_okey_.rar", "spec/data/rar/cd1/974_okey_.rar", "spec/data/rar/cd1/978_okey_.rar", "spec/data/rar/cd1/982_okey_.rar", "spec/data/rar/cd1/988_okey_.rar", "spec/data/rar/cd1/998_okey_.rar", "spec/data/rar/cd1/Unreachable/117_not_.rar", "spec/data/rar/cd1/Unreachable/12_not_.rar", "spec/data/rar/cd1/Unreachable/171_not_.rar", "spec/data/rar/cd1/Unreachable/178_not_.rar", "spec/data/rar/cd1/Unreachable/179_not_.rar", "spec/data/rar/cd1/Unreachable/202_not_.rar", "spec/data/rar/cd1/Unreachable/214_not_.rar", "spec/data/rar/cd1/Unreachable/423_not_.rar", "spec/data/rar/cd1/Unreachable/46_not_.rar", "spec/data/rar/cd1/Unreachable/477_not_.rar", "spec/data/rar/cd1/Unreachable/499_not_.rar", "spec/data/rar/cd1/Unreachable/531_not_.rar", "spec/data/rar/cd1/Unreachable/536_not_.rar", "spec/data/rar/cd1/Unreachable/554_not_.rar", "spec/data/rar/cd1/Unreachable/556_not_.rar", "spec/data/rar/cd1/Unreachable/564_not_.rar", "spec/data/rar/cd1/Unreachable/569_not_.rar", "spec/data/rar/cd1/Unreachable/608_not_.rar", "spec/data/rar/cd1/Unreachable/614_not_.rar", "spec/data/rar/cd1/Unreachable/634_not_.rar", "spec/data/rar/cd1/Unreachable/644_not_.rar", "spec/data/rar/cd1/Unreachable/708_not_.rar", "spec/data/rar/cd1/Unreachable/756_not_.rar", "spec/data/rar/cd1/Unreachable/802_not_.rar", "spec/data/rar/cd1/Unreachable/815_not_.rar", "spec/data/rar/cd1/Unreachable/833_not_.rar", "spec/data/rar/cd1/Unreachable/84_not_.rar", "spec/data/rar/cd1/Unreachable/92_not_.rar", "spec/data/rar/cd1/Unreachable/936_not_.rar", "spec/data/rar/cd1/Unreachable/939_not_.rar", "spec/data/rar/cd2/102_okey_without_.strange", "spec/data/rar/cd2/111_okey_without_.strange", "spec/data/rar/cd2/14_okey_without_.strange", "spec/data/rar/cd2/242_okey_without_.strange", "spec/data/rar/cd2/244_okey_without_.strange", "spec/data/rar/cd2/248_okey_without_.strange", "spec/data/rar/cd2/278_okey_without_.strange", "spec/data/rar/cd2/283_okey_without_.strange", "spec/data/rar/cd2/310_okey_without_.strange", "spec/data/rar/cd2/439_okey_without_.strange", "spec/data/rar/cd2/453_okey_without_.strange", "spec/data/rar/cd2/461_okey_without_.strange", "spec/data/rar/cd2/476_okey_without_.strange", "spec/data/rar/cd2/484_okey_without_.strange", "spec/data/rar/cd2/491_okey_without_.strange", "spec/data/rar/cd2/507_okey_without_.strange", "spec/data/rar/cd2/518_okey_without_.strange", "spec/data/rar/cd2/609_okey_without_.strange", "spec/data/rar/cd2/613_okey_without_.strange", "spec/data/rar/cd2/633_okey_without_.strange", "spec/data/rar/cd2/644_okey_without_.strange", "spec/data/rar/cd2/682_okey_without_.strange", "spec/data/rar/cd2/706_okey_without_.strange", "spec/data/rar/cd2/767_okey_without_.strange", "spec/data/rar/cd2/788_okey_without_.strange", "spec/data/rar/cd2/801_okey_without_.rar", "spec/data/rar/cd2/808_okey_without_.strange", "spec/data/rar/cd2/837_okey_without_.strange", "spec/data/rar/cd2/919_okey_without_.strange", "spec/data/rar/cd2/93_okey_without_.strange", "spec/data/rar/cd2/980_okey_without_.strange", "spec/data/rar/subdir/133_subtitle_.rar", "spec/data/rar/subdir/169_subtitle_.rar", "spec/data/rar/subdir/22_subtitle_.rar", "spec/data/rar/subdir/483_subtitle_.rar", "spec/data/rar/subdir/639_subtitle_.rar", "spec/data/rar_real/test_package.rar", "spec/data/zip_real/some_zip_files.zip", "spec/spec_helper.rb", "spec/unpack_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<mimer_plus>, ["~> 0.0.4"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<mimer_plus>, ["~> 0.0.4"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<mimer_plus>, ["~> 0.0.4"])
  end
end
