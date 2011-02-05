Dir["#{File.expand_path('../vendor/cache', __FILE__)}/**"].map { |dir| File.directory?(lib = "#{dir}/lib") ? lib : dir }.each do |folder|
  $:.unshift(folder)
end

require 'rspec'
require "#{File.dirname(__FILE__)}/../lib/movish_script"

RSpec.configure do |config|
  config.mock_with :rspec
end