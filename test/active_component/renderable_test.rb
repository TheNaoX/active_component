require 'test_helper'

class ActiveComponent::RenderableTest < ActiveSupport::TestCase

  test "renders a component" do
    FooComponent.any_instance.stubs(:render).returns("")
    assert_nothing_raised TypeError do
      ActionView::Base.new.render_component(:foo)
    end
  end

  test "gets a component instance from symbol" do
    FooComponent.any_instance.stubs(:render).returns("")
    assert_kind_of String, ActionView::Base.new.render_component(:foo)
  end

end
