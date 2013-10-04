require 'active_support/concern'

# 
# Work In Progress
#
# The idea is to provide a clean rails-like methods to
# render view components nicely from the view or even respond
# with them from a controller instance
#
# render_component(:view_component, var: var)
#
module ActiveComponent
  module Renderable
    extend ActiveSupport::Concern

    def render_component
      ""
    end
  end
end
