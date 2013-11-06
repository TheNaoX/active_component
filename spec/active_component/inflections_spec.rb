require 'test/unit'
require 'rack/test'

class ActiveComponent::InflectionsTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def test_active_component_constantize
    text = "FooComponent"
    assert_equal FooComponent, text.constantize
  end

  def test_active_component_camelize
    text = 'foo_component'
    assert_equal 'FooComponent', text.camelize
  end

  def test_active_component_camelize_constantize
    text = 'foo_component'
    assert_equal FooComponent, text.camelize.constantize
  end
end
