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

    def render_component(type, args={})
      resource = constantize("#{type.to_s}_component").new(args)
      resource.render
    end

    def constantize(type)
      type = type.camelize.constantize
      unless type.superclass == ActiveComponent::Base
        raise TypeError, ":type must be compliant to any existing component class"
      end
      type
    end

  end
end

ActionView::Base.send(:include, ActiveComponent::Renderable)
