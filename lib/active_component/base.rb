require 'mustache'

module ActiveComponent
  class Base < Mustache
    include ActionView::Helpers::DateHelper

    def initialize(args = {})
      if args.kind_of? Hash

        args.each do |key, value|
          self.send("#{key}=", value)
        end

      else
        raise ArgumentError, "Expected: Hash. Received: #{args.class.name}"
      end
    end
  end
end
