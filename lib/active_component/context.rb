module ActiveComponent
  module Context

    def self.included(base)
      base.before_filter(:get_context)
    end

    def get_context
      ActiveComponent.set_controller(self)
    end

  end
end
