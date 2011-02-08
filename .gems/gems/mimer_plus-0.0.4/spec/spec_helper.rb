require "#{File.dirname(__FILE__)}/../lib/mimer_plus"

RSpec.configure do |config|
  
end

# Get a filename to a fixture file
def fixture_path(filename)
  File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
end