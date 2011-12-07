# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "csv-to-json/version"

Gem::Specification.new do |s|
  s.name        = "csv-to-json"
  s.version     = CsvToJson::VERSION
  s.authors     = ["maerzbow"]
  s.email       = ["maerzbow@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{helps to genarte json files from csv files}
  s.description = s.summary #TODO

  s.rubyforge_project = "csv-to-json"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
