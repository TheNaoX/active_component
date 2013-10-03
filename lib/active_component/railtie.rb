module ActiveComponent
  class Railtie < Rails::Railtie
    initializer "Appends a method to the action controller class" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, ActiveComponent::Context)
        ActionController::Base.send(:include, ActiveComponent::Renderable)
      end
    end
  end
end
