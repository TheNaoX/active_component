require 'active_component/renderable'

module ActiveComponent
  class Railtie < Rails::Railtie
    initializer "Appends a method to the action controller class" do
      ActiveSupport.on_load(:action_controller) do
        include ActiveComponent::Renderable
      end
    end
  end
end
