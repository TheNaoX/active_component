require 'sinatra/base'
require 'active_component/renderable'
require 'active_component/base'

module ActiveComponent
  module Sinatra
    app.helpers ActiveComponent::Base
  end
end

Sinatra.register ActiveComponent::Sinatra
