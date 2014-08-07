$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.dirname(__FILE__)

begin
  require 'rails'
rescue LoadError
end

require 'bundler/setup'
Bundler.require

if defined? Rails
  ENV["RAILS_ENV"] = "test"
  require File.expand_path("../dummy/config/environment.rb", __FILE__)

  require 'rspec/rails'
end

RSpec.configure do |config|
end

def fixture(file)
  File.new(File.expand_path("./spec/fixtures/" + file))
end

def fixture_yaml(file)
  YAML.load_file(File.expand_path("./spec/fixtures/" + file))
end
