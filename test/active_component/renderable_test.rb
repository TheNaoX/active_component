require 'test_helper'

class ActiveComponent::RenderableTest < ActiveSupport::TestCase

  test "renders a component" do
    assert_kind_of(String, FooController.new.render_component)
  end

end
