module ActiveComponent
  @@controller = {}

  class << self
    def get_controller
      @@controller[Thread.current.object_id]
    end

    def set_controller(controller)
      @@controller[Thread.current.object_id] = controller
      ObjectSpace.define_finalizer Thread.current, -> (id){ @@controller[id].delete! }
    end
  end

  module Context

    def self.included(base)
      base.before_filter(:get_context)
    end

    def get_context
      ActiveComponent.set_controller(self)
    end

  end

end
