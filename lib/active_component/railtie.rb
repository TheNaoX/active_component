require 'active_component/renderable'
require 'active_component/context'

module ActiveComponent
  class Railtie < Rails::Railtie
    initializer "Appends a method to the action controller class" do
      ActiveSupport.on_load(:action_controller) do
        include ActiveComponent::Renderable
        include ActiveComponent::Context
      end
    end
  end
end
