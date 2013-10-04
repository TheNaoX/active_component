#
#
# This is an autoincluded module for ActionController::Base
# 
# It will store the controller context for the given request in a
# @@controllers hash.
#
# It was necessary to remove the controller instance from the
# @@controllers hash manually using ObjectSpace to prevent memory
# leaks in the server.
#
# You can call ActiveComponent.get_controller from anywhere in the 
# application.
#
module ActiveComponent
  @@controllers = {}

  class << self

    def controllers
      if Rails.env.test?
        @@controllers
      else
        puts "WARNING: ActiveComponent#controllers cannot be accessible from outside of the class"
      end
    end

    def get_controller
      @@controllers[Thread.current.object_id]
    end

    def set_controller(controller)
      @@controllers[Thread.current.object_id] = controller
      ObjectSpace.define_finalizer Thread.current, -> (id){ @@controllers[id].delete! }
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
