require 'active_component/base'
require 'active_component/renderable'
require 'active_component/context'
require 'active_component/railtie' if defined?(Rails)

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
end
