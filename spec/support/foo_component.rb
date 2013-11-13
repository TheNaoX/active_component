class FooComponent < ActiveComponent::Base
  def render
    "<div>#{bar}</div>#{baz}"
  end
end
