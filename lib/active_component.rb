require 'sinatra'
require 'sinatra/base'
require_relative 'active_component/renderable'
require 'active_component/context' if defined?(Rails)
require 'active_component/railtie' if defined?(Rails)
require_relative 'active_component/base'

module ActiveComponent
end
