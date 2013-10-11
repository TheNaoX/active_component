# ActiveComponent
[![Gem Version](https://badge.fury.io/rb/active-component.png)](http://badge.fury.io/rb/active-component)
[![Build Status](https://travis-ci.org/TheNaoX/active_component.png?branch=master)](https://travis-ci.org/TheNaoX/active_component)
[![Code Climate](https://codeclimate.com/github/TheNaoX/active_component.png)](https://codeclimate.com/github/TheNaoX/active_component)
[![Coverage Status](https://coveralls.io/repos/TheNaoX/active_component/badge.png)](https://coveralls.io/r/TheNaoX/active_component)

A View-Component framework for Rails applications.

## Usage

Add the gem to your gemfile

```ruby
gem "active-component", :require => "active_component"
```

Or install it manually

```bash
$ gem install active-component
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

```html
<li>
  <a href="mailto:{{ email }}">
    {{ name }}
  </a>
  <span>{{ message }}</span>
</li>
```

In your rails view

```erb
<%= render_component(:activity) %>
```

## Features

### Controller context from your component class


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

### Passing variables

You can pass variables in the object instance

```ruby
class ActivityComponent < ActiveComponent::Base
  attr_accessor :name
end
```

```erb
<%= render_component(:activity, :name => current_user.name) %>
```

### Collection Rendering

You can render component collections from the view or from another component

```erb
<%= render_component(:activity, :collection => activities, :as => :activity) %>
```

And pass local variables

```erb
<%= render_component(:activity, :collection => activities, :as => :activity, :locals => { :foo => "foo" }) %>
```

Where the `:collection` is an array of elements (database records, hashes, stings, etc), and the `:as` is the name of the instance attribute defined in your component class.

NOTICE In order to use the collection feature you have to define with `attr_accessor` the name of the attribute to be received by the component class.

## Sinatra

You can add this gem to sinatra, with the following configuration in your app

```ruby
require 'active_component'

class App < Sinatra::Base

  helpers ActiveComponent::Base

  get '/' do
    render_component(:activity)
  end

end
```

## Future short term features

* Test helpers, (rspec, minitest)
* Support for more templating engines.

Inspired from [Cells](https://github.com/apotonick/cells) framework done by [Apotonick](https://github.com/apotonick).

This project rocks and uses [MIT-LICENSE](https://github.com/TheNaoX/active_component/blob/master/MIT-LICENSE).
