require 'test/unit'
require 'rack/test'

class SinatraTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    FooSinatra
  end

  def test_includes_render_component
    get '/'
    assert last_response.ok?
    assert_equal '<div>Hello</div>world!', last_response.body
  end

end
