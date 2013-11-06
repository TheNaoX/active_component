require 'spec_helper'
require 'rack/test'

describe "Sinatra test" do
  include Rack::Test::Methods

  def app
    FooSinatra
  end

  it "includes render component" do
    get '/'
    expect(last_response.ok?).to be_true
    expect(last_response.body).to eq('<div>Hello</div>world!')
  end

end
