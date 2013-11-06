require 'spec_helper'

describe ActiveComponent::Context do

  before do
    FooController.new.get_context
  end

  it "returns a cotroller instance" do
    expect(
      ActiveComponent.get_controller
    ).to be_kind_of(FooController)
  end

  it "saves the controller in a @@controllers hash" do
    expect {
      ActiveComponent.set_controller(FooController.new)
    }.to_not raise_error
  end

  it "it returns exactly the same controller sent" do
    controller = FooController.new
    controller.get_context
    expect(
      ActiveComponent.controllers[Thread.current.object_id]
    ).to eq(controller)
  end

  it "includes the before filter into action controller" do
    expect(
      ActionController::Base.new._process_action_callbacks.first.filter
    ).to eq(:get_context)
  end

  it "gets the context for a given contrlller" do
    expect {
      ActionController::Base.new.get_context
    }.to_not raise_error
  end
end
