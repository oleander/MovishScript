require 'rspec'

$:.push File.expand_path("../../lib/movish_script/", __FILE__)
$:.push File.expand_path("../../lib/", __FILE__)

require "movish_script"
require "movish_config"

RSpec.configure do |config|
  config.mock_with :rspec
end