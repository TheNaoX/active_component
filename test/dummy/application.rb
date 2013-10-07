require 'rubygems'
require 'rails'
require 'action_controller/railtie'

class Dummy < Rails::Application  
  config.session_store :cookie_store, :key => '_omg_session'
  config.secret_token = '1319d8ccf1b9bfbdefcb6aa380a044ce'
  config.encoding = "utf-8"
end
