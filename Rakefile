task :build do
  # Download all gems into vendor/cache
  puts %x{bundle package}
  
  # Unpack all gems
  %x{cd vendor/cache && find . -name '*.gem'}.split(/\n/).each do |gem|
    puts %x{cd vendor/cache && gem unpack #{gem} && rm #{gem}} unless gem.nil?
  end
  
  # Removing the test gems
  puts %x{cd vendor/cache && rm -r rspec*}
end

