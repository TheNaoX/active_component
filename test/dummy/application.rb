require "rails"
require "action_controller/railtie"
require "active_component"
 
class Dummy < Rails::Application
 
  # Enable cache classes. Production style.
  config.cache_classes = false

  # Config eager loading
  config.eager_load = false
 
  # We need a secret token for session, cookies, etc.
  config.secret_token = "49837489qkuweoiuoqwehisuakshdjksadhaisdy78o34y138974xyqp9rmye8yrpiokeuioqwzyoiuxftoyqiuxrhm3iou1hrzmjk"
end
 
# Initialize the app (originally in config/environment.rb)
Dummy.initialize!
