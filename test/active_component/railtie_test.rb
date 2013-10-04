require 'test_helper'

class ActiveComponent::RailtieTest < ActiveSupport::TestCase

  test "has before filter" do
    assert_equal :get_context, ActionController::Base.new._process_action_callbacks.first.filter
  end

  test "has the context method" do
    assert_nothing_raised Exception do
      ActionController::Base.new.get_context
    end
  end

end
