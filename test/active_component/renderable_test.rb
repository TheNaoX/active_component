require 'test_helper'

class ActiveComponent::RenderableTest < ActiveSupport::TestCase

  setup do
    @view = ActionView::Base.new
  end

  test "renders a component" do
    assert_nothing_raised Exception do
      @view.render_component(:foo)
    end
  end

  test "gets a component instance from symbol" do
    assert_kind_of String, @view.render_component(:foo)
  end

  test "accepts only a symbol and a hash" do
    assert_raise ArgumentError do
      @view.render_component(nil, nil)
    end
  end

  test "it renders multiple components if receives a collection array" do
    collection = ["hello!", "world!"]
    string = @view.render_component(:foo, :collection => collection, :as => :bar)
    assert_equal "<div>hello!</div><div>world!</div>", string
  end

  test "it raises an error if the given arguments didn't include the :as argument" do
    assert_raise ArgumentError do
      @view.render_component(:foo, :collection => [1,2])
    end
  end

  test "it accepts locals for a given collection" do
    string = @view.render_component(
      :foo,
      :collection => [1,2],
      :as => :bar,
      :locals => { :baz => "baz" }
    )
    assert_match /baz/, string
  end

end
