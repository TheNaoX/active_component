require 'test_helper'

class ActiveComponent::ContextTest < ActiveSupport::TestCase

  def setup
    FooController.new.get_context
  end

  test "returns a cotroller instance" do
    assert_kind_of FooController, ActiveComponent.get_controller
  end

  test "saves the controller in a @@controllers hash" do
    assert_nothing_raised Exception do
      ActiveComponent.set_controller(FooController.new)
    end
  end

  test "it returns exactly the same controller sent" do
    controller = FooController.new
    controller.get_context
    assert_equal controller, ActiveComponent.controllers[Thread.current.object_id]
  end
end
