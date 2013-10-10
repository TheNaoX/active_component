require 'active_support/concern' if defined?(Rails)

# 
# This provides a clean implementation for rendering your template
# inside your view.
#
# <%= render_component(:view, var: var) %>
#
# In addition to that you can render a collection of components using
# the same helper method
#
# <%= render_component(:view, collection: views, as: :view)%>
#
# The :as argument helps you to provide the instance variable name that
# you defined int your component class and it will be received like that.
#
module ActiveComponent
  module Renderable

    def render_component(type, args={})
      raise_errors(type, args) if type.nil? or args.nil?

      unless args[:collection].present?
        template(type, args)
      else
        collection(type, args[:collection], args[:as], args[:locals])
      end
    end

    private

    def template(type, args)
      resource = constantize("#{type.to_s}_component").new(args)
      resource.render
    end

    def collection(type, collection, as, locals)

      error_string = "Attempting to render a collection without specifying the ':as' value"
      raise ArgumentError, error_string if as.nil?

      locals = locals || {}

      html_string = collection.map do |item|
        template(
          type,
          locals.merge(as => item)
        )
      end

      html_string.join('')
    end

    def constantize(type)
      type = type.camelize.constantize
      type
    end

    def raise_errors(type, args)
      text = "Invalid arguments. Received: #{type.class}, #{args.class}. Expected: Symbol, Hash"
      raise ArgumentError, text
    end

  end
end

ActionView::Base.send(:include, ActiveComponent::Renderable) if defined?(Rails)
