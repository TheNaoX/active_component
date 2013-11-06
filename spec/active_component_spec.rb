require 'spec_helper'

describe ActiveComponent do

  it "has a get controller method" do
    expect {
      ActiveComponent.get_controller
    }.to_not raise_error
  end

end
