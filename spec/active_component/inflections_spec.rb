require 'spec_helper'

describe ActiveComponent::Inflections do
  it 'creates a constant out of a string' do
    text = "FooComponent"
    expect(text.constantize).to eq(FooComponent)
  end

  it 'creates a camelized string out of an underscore string' do
    text = 'foo_component'
    expect(text.camelize).to eq('FooComponent')
  end

  it 'creates a constant out of an underscore string' do
    text = 'foo_component'
    expect(text.camelize.constantize).to eq(FooComponent)
  end
end
