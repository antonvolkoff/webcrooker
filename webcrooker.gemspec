# -*- encoding: utf-8 -*-
require File.expand_path('../lib/webcrooker/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Anton Volkov"]
  gem.email         = ["choixer@gmail.com"]
  gem.description   = "Gem for scraping data from websites"
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "webcrooker"
  gem.require_paths = ["lib"]
  gem.version       = Webcrooker::VERSION

  gem.add_dependency 'nokogiri', '~> 1.5'
  
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'fakeweb'
end
