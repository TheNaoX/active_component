class FooSinatra < Sinatra::Base
  helpers ActiveComponent::Renderable

  get '/' do
    render_component(:foo, bar: 'Hello', baz: 'world!')
  end
end
