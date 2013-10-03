require 'test_helper'

class ActiveComponent::RenderableTest < ActiveSupport::TestCase

  class Controller
    include ::ActiveComponent::Renderable
  end

  test "renders a component" do
    assert_kind_of(String, Controller.new.render_component)
  end

end
