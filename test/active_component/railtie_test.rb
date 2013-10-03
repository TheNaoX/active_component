require 'test_helper'

class ActiveComponent::RailtieTest < ActiveSupport::TestCase

  test "get the controller context" do
    assert FooController.new.render_component
  end

end
