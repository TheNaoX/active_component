$:.push File.expand_path("../lib", __FILE__)
require "active_component/version"
Gem::Specification.new do |s|
  s.name        = "active-component"
  s.version     = ActiveComponent::VERSION
  s.authors     = ["Antonio Chavez", "Jesus Romero"]
  s.email       = ["cavjzz@gmail.com", "elherzt@gmail.com"]
  s.homepage    = "https://github.com/TheNaoX/active_component"
  s.summary     = "A View-Component framework for ruby applications."
  s.description = "A View-Component framework for ruby applications."
  s.licenses    = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "mustache"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "faker"
  s.add_development_dependency "pry"
  s.add_development_dependency "mocha"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "sinatra"
  s.add_development_dependency "rails"

  # Rspec testing framework
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-core"
  s.add_development_dependency "rspec-expectations"
  s.add_development_dependency "rspec-mocks"
  s.add_development_dependency "rspec-rails"
end
