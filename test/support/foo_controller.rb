class FooController < ApplicationController
  def index
  end

  def dummy_action
    yield
  end
end
