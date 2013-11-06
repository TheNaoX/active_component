# Configure Rails Environment
ENV["RAILS_ENV"] ||= "test"

require "dummy/application.rb"
require 'faker'
require 'pry'
require 'sinatra'
require 'coveralls'

Coveralls.wear!

Rails.backtrace_cleaner.remove_silencers!

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
