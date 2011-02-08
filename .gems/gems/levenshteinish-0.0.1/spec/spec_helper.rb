require 'rspec'
require "#{File.dirname(__FILE__)}/../lib/levenshteinish"

RSpec.configure do |config|
  config.mock_with :rspec
end