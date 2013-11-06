require 'spec_helper'

describe ActiveComponent::Renderable do

  before do
    @view = ActionView::Base.new
    @collection = ["hello!", "world!"]
  end

  it "renders a component" do
    expect{
      @view.render_component(:foo)
    }.to_not raise_error
  end

  it "gets a component instance from symbol" do
    expect(@view.render_component(:foo)).to be_kind_of(String)
  end

  it "accepts only a symbol and a hash" do
    expect{
      @view.render_component(nil, nil)
    }.to raise_error(ArgumentError)
  end

  it "it renders multiple components if receives a collection array" do
    string = @view.render_component(:foo, :collection => @collection, :as => :bar)
    expect(string).to eq("<div>hello!</div><div>world!</div>")
  end

  it "it raises an error if the given arguments didn't include the :as argument" do
    expect {
      @view.render_component(:foo, :collection => [1,2])
    }.to raise_error(ArgumentError)
  end

  it "it accepts locals for a given collection" do
    string = @view.render_component(
      :foo,
      :collection => @collection,
      :as => :bar,
      :locals => { :baz => "baz" }
    )
    expect(string).to match(/baz/)
  end

  it "it returns a string of multiple elements" do
    string = @view.send(:collection, :foo, @collection, :bar, nil)
    expect(string).to eq("<div>hello!</div><div>world!</div>")
  end

  it "it returns a string from the template" do
    string = @view.send(:element, :foo, :bar => "Hello world!")
    expect(string).to eq("<div>Hello world!</div>")
  end

  it "it turns a string into a constant" do
    expect(@view.send(:constantize, "foo_component")).to eq(FooComponent)
  end

  it "it raises an error" do
    expect{
      @view.send(:raise_errors, :foo, {})
    }.to raise_error(ArgumentError)
  end

end
