require 'sinatra/base'
require_relative '../renderable'
require_relative '../base'

module Sinatra
  module ActiveComponent
    module Helpers
      def sinatra_render_component(type, args={})
        render_component(type, args)
      end
      
      def self.registered(app)
        app.helpers Helpers
      end
    end
  end
  register ActiveComponent
end
