class FooComponent < ActiveComponent::Base
  attr_accessor :bar, :baz

  def render
    "<div>#{bar}</div>#{baz}"
  end
end
