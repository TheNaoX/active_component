require 'test_helper'

class ActiveComponent::BaseTest < ActiveSupport::TestCase

  class Foo < ActiveComponent::Base
    attr_accessor :bar
  end

  def setup
    @foo = Foo.new(bar: "bar")
  end

  test "has included date helper from action view" do
    assert @foo.distance_of_time_in_words_to_now(1.day.ago)
  end

  test "a new instance of active_component/base accepts only a hash of arguments" do
    assert_nothing_raised(ArgumentError, nil) { Foo.new(bar: Faker::Name.name) }
  end

  test "a new instance of active component should raise an error if the given value is not a hash" do
    assert_raise(ArgumentError, nil) { Foo.new(Faker::Lorem.sentence) }
  end
  
  test "assigns the values to instance variables" do
    assert_equal @foo.bar, "bar"
  end

end
