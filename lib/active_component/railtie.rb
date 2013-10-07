#
# Autoinclude some of the modules from the controller top level
#
module ActiveComponent
  class Railtie < Rails::Railtie
    ActionController::Base.send(:include, ActiveComponent::Context)
    initializer "Appends a method to the action controller class" do
    end
  end
end
