require 'mustache'
require 'ostruct'

module ActiveComponent
  #
  # We inherit from mustache to have a default template engine
  # for the application, we might add more templating options in the
  # future.
  #
  class Base < OpenStruct
    #
    # We're going to eventually add the view helpers to this side of
    # the application in order to allow this class to interact with
    # the rails conventions, especially with the asset pipeline.
    #
    include ActionView::Helpers::DateHelper if defined?(ActionView)
    include ActiveComponent::Renderable
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
    def initialize(hash=nil)
      raise ArgumentError, "Expected: Hash. Received: #{hash.class.name}" unless hash.kind_of? Hash
      super
      @controller = ActiveComponent.get_controller if defined?(Rails)
    end

    def controller
      @controller
    end

    def render
      super.html_safe
    end
  end
end
