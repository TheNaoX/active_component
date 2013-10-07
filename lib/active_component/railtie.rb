#
# Autoinclude some of the modules from the controller top level
#
module ActiveComponent
  class Railtie < Rails::Railtie
    case Rails.version
    when "4.0.0"
      initializer "Includes the concern in the action controller class" do
        ActiveSupport.on_load(:action_controller) do
          ActionController::Base.send(:include, ActiveComponent::Context)
        end
      end
    else
      ActionController::Base.send(:include, ActiveComponent::Context)
    end
   end
end
