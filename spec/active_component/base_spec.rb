require 'spec_helper'

describe ActiveComponent::Base do

  before do
    FooController.new.get_context
    @foo = FooComponent.new(:bar => "bar")
  end

  it "has included date helper from action view" do
    expect{
      @foo.distance_of_time_in_words_to_now(Time.now)
    }.to_not raise_error
  end

  it "a new instance of active_component/base accepts only a hash of arguments" do
    expect{
      FooComponent.new(:bar => Faker::Name.name)
    }.to_not raise_error
  end

  it "a new instance of active component should raise an error if the given value is not a hash" do
    expect{
      FooComponent.new(Faker::Lorem.sentence)
    }.to raise_error(ArgumentError)
  end

  it "assigns the values to instance variables" do
    expect(@foo.bar).to eq("bar")
  end

  it "sets controller for the component context" do
    expect(@foo.controller).to be_kind_of(FooController)
  end

  it "has the action view helpers available" do
    FooComponent.stub(:render).and_return("")
    expect{
      @foo.render_component(:foo, :bar => "bar")
    }.to_not raise_error
  end

  it "only accepts hashes" do
    expect {
      @foo.assign_variables('a')
    }.to raise_error(ArgumentError)
  end

  it "assigns from the given hash to the instance variables" do
    @foo.assign_variables(:bar => "foo")
    expect(@foo.bar).to eq("foo")
  end

  it "has a controller method" do
    @foo.stub(:controller).and_return(true)
    expect(@foo.controller).to be_true
  end

  it "has a render method" do
    expect(@foo.render).to be_true
  end

end
