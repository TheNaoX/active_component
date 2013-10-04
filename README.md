# ActiveComponent
[![Build Status](https://travis-ci.org/TheNaoX/active_component.png?branch=master)](https://travis-ci.org/TheNaoX/active_component)

A View-Component framework for Rails applications.

## Usage

Add the gem on your gemfile

```ruby
gem "active_component"
```

Or install it manually

```bash
$ gem install active_component
```

You will have accessible all the modules from the gem in your Rails application.

In order to create a new View-Component item in your application you can use a generator.

```bash
$ bundle exec rails generate component activity
      create  app/components/application_component.rb
      create  app/components/activity_component.rb
      create  app/templates/activity_component.mustache
```

You're going to be able to add methods to your component class and call them from the mustache template

```ruby
class ActivityComponent < ActiveComponent::Base
  def name
    "Antonio"
  end

  def email
    "cavjzz@gmail.com"
  end

  def message
    "Has just signed up!"
  end
end
```

And in your template:

```mustache
<li>
  <a href="mailto:{{ email }}">
    {{ name }}
  </a>
  <span>{{ message }}</span>
</li>
```

In your rails view

```erb
<%= ActivityComponent.new.render.html_safe %>
```

## Features

You can access the controller context from where the component is instanced

```ruby
class ActivityComponent < ActiveComponent::Base
  def name
    controller.current_user.name
  end

  def message
    controller.activity.message
  end
end
```

You can pass variables in the object instance

```ruby
class ActivityComponent < ActiveComponent::Base
  attr_accessor :name
end
```

``` erb
<%= ActivityComponent.new(name: current_user.name) %>
```

## Future short term features

* A nicer method to call the component `render_component(:activity)`.
* Support for more templating engines.

Inspired by [Cells](https://github.com/apotonick/cells) framework done by [Apotonick](https://github.com/apotonick).

This project rocks and uses [MIT-LICENSE](https://github.com/TheNaoX/active_component/blob/master/MIT-LICENSE).