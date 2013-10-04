class <%= file_name.camelize %>Component < ApplicationComponent

  # NOTICE: Do not remove this line this references the template path for the actual component
  self.template_path = File.dirname("#{Rails.root}/app/templates/#{self.class.name.underscore}")

end
