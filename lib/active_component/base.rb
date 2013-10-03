require 'mustache'

module ActiveComponent
  class Base < Mustache
    attr_accessor :controller
    include ActionView::Helpers::DateHelper

    def initialize(args = {})
      if args.kind_of? Hash
        assign_variables args
        self.controller = ActiveComponent.get_controller
      else
        raise ArgumentError, "Expected: Hash. Received: #{args.class.name}"
      end
    end

    def assign_variables(args)
      args.each do |key, value|
        self.send("#{key}=", value)
      end
    end
  end
end
