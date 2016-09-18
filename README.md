# factory_girl_web

A web interface for factory_girl

![](https://i.gyazo.com/dd2a8d28e490369b80fb9a824188b2d3.png)

## Installation

First add the gem to your development environment and run the `bundle` command to install it.

```ruby
gem 'factory_girl_web', group: :development
```

## Usage

Add to your routes.rb:

```ruby
Your::App.routes.draw do
  if Rails.env.development?
    mount FactoryGirlWeb::Engine, at: '/factory_girl_web'
  end
end
```

Then visit `http://localhost:3000/factory_girl_web`, you can create defined factories through web interface.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
