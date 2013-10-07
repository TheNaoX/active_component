# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "dummy/application.rb"
require "rails/test_help"
require 'faker'
require 'pry'
require 'mocha' 
require 'active_component'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__) + '/support/**/*.rb'}"].each { |f| require f}

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end
