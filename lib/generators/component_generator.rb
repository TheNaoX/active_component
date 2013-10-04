class ComponentGenerator < Rails::Generators::NamedBase
  self.source_root File.expand_path("../templates", __FILE__)
  
  desc "Creates view component"
  
  def create_component
    copy_file   "application_component.rb", "app/components/application_component.rb"
    template    "component.rb", "app/components/#{file_name}_component.rb"
    create_file "app/templates/#{file_name}_component.mustache"
  end
end
