require 'test_helper'

class ActiveComponentTest < ActiveSupport::TestCase

  test "has a get controller method" do
    assert ActiveComponent.get_controller
  end

end
