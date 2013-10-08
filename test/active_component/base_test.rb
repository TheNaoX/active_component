require 'test_helper'

class ActiveComponent::BaseTest < ActiveSupport::TestCase

  def setup
    FooController.new.get_context
    @foo = FooComponent.new(:bar => "bar")
  end

  test "has included date helper from action view" do
    assert @foo.distance_of_time_in_words_to_now(Time.now)
  end

  test "a new instance of active_component/base accepts only a hash of arguments" do
    assert_nothing_raised(ArgumentError, nil) { FooComponent.new(:bar => Faker::Name.name) }
  end

  test "a new instance of active component should raise an error if the given value is not a hash" do
    assert_raise(ArgumentError, nil) { FooComponent.new(Faker::Lorem.sentence) }
  end

  test "assigns the values to instance variables" do
    assert_equal @foo.bar, "bar"
  end

  test "sets controller for the component context" do
    assert_kind_of FooController, @foo.controller
  end

  test "has the action view helpers available" do
    assert_nothing_raised Exception do
      FooComponent.any_instance.stubs(:render).returns("")
      @foo.render_component(:foo, :bar => "bar")
    end
  end
end
