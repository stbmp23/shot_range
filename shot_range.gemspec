$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shot_range/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shot_range"
  s.version     = ShotRange::VERSION
  s.authors     = ["masa suzuki"]
  s.email       = ["stbmp23@gmail.com"]
  s.homepage    = "https://github.com/stbmp23/shot_range"
  s.summary     = "A Simple Profiler for Rails"
  s.description = "shot_range is a simple profiler for rails application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = `git ls-files -- {test,spec,features}*`.split("\n")

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "bson_ext"
  s.add_dependency "fluent-logger"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
end
