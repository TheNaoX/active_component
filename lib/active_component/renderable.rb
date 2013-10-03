require 'active_support/concern'

module ActiveComponent
  module Renderable
    extend ActiveSupport::Concern

    def render_component
      ""
    end
  end
end
