require 'active_support/concern'

# 
# This provides a clean implementation for rendering your template
# inside your view.
#
# <%= render_component(:view, var: var) %>
#
module ActiveComponent
  module Renderable

    def render_component(type, args={})
      resource = constantize("#{type.to_s}_component").new(args)
      resource.render
    end

    def constantize(type)
      type = type.camelize.constantize
      type
    end

  end
end

ActionView::Base.send(:include, ActiveComponent::Renderable)
