require 'mustache'

module ActiveComponent
  #
  # We inherit from mustache to have a default template engine 
  # for the application, we might add more templating options in the 
  # future.
  #
  class Base < Mustache
    #
    # We're going to eventually add the view helpers to this side of
    # the application in order to allow this class to interact with
    # the rails conventions, especially with the asset pipeline.
    #
    include ActionView::Helpers::DateHelper
    #
    # Whenever the user creates a new object from a class inherited
    # from ActiveComponent::Base it needs to define its attributes as
    # `attr_accessor :var` in order to be able to initialize the object
    # with specific values.
    #
    # class ViewComponent < ActiveComponent::Base
    #   attr_accessor :var
    # end
    #
    # The values shall be provided as hash, active component automatically
    # will know who's going to receive the value otherwise raise an error.
    #
    # component = ViewComponent.new(var: var)
    #
    # In addition to this we provide the controller context from where the
    # view component is called.
    # 
    # self.controller from anywhere in the inherited classes.
    #
    def initialize(args = {})
      if args.kind_of? Hash
        assign_variables args
        @controller = ActiveComponent.get_controller rescue nil
      else
        raise ArgumentError, "Expected: Hash. Received: #{args.class.name}"
      end
    end

    def assign_variables(args)
      args.each do |key, value|
        self.send("#{key}=", value)
      end
    end

    def controller
      @controller
    end

    def render
      super.html_safe
    end
  end
end
