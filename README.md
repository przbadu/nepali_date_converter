[![Build Status](https://circleci.com/gh/przbadu/nepali_date_converter.svg?style=svg)](https://app.circleci.com/pipelines/github/przbadu/nepali_date_converter)
[![Gem Version](https://badge.fury.io/rb/nepali_date_converter.svg)](https://badge.fury.io/rb/nepali_date_converter)
# Related

[C# Class Library](https://github.com/przbadu/NepaliDateConverterCS)

# NepaliDateConverter

A ruby library to convert A.D (english) date to B.S (nepali) date and vice versa.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nepali_date_converter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nepali_date_converter

## Usage

Convert A.D to B.S

```ruby
NepaliDateConverter::Convert.to_nepali(yyyy, mm, dd)

# Example:
NepaliDateConverter::Convert.to_nepali(2017, 06, 20)
# => {:year=>2074, :month=>3, :date=>6, :day=>"Tuesday", :nepali_month=>"Ashad", :week_day=> 3}
```

convert B.S to A.D

```ruby
NepaliDateConverter::Convert.to_english(yyyy, mm, dd)

# Example:
NepaliDateConverter::Convert.to_english(2074, 3, 6)
# => {:year=>2017, :month=>6, :date=>20, :day=>"Tuesday", :english_month=>"June", :week_day=>3}
```

## TODO

* Add more specs

## Gotcha

Till now, we can only convert date from 2000 to 2089 B.S (nepali date).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nepali_date_converter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

