#
# Autoinclude some of the modules from the controller top level
#
require 'rails'
module ActiveComponent
  class Railtie < Rails::Railtie
    binding.pry
    initializer "Appends a method to the action controller class" do
      #ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, ActiveComponent::Context)
      #end
    end
  end
end
