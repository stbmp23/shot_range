$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'shot_range'

require 'rspec/autorun'

RSpec.configure do |config|
end

def fixture(file)
  File.new(File.expand_path("./spec/fixtures/" + file))
end
