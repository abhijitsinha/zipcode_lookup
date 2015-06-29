# ZipcodeLookup

Welcome to zipcode lookup. This gem fetches geo-details via zipcode lookup. It uses couple of API - Google and Ziptastic for fetching geo-details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zipcode_lookup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zipcode_lookup

## Usage

    $ ZipcodeLookup.fetch_details(zip)

    The code lookups to Ziptastic API to fetch details, if fails or does not retrieve details - it lookups google api. On successful lookup, a geoobject with city, state, country and county is returned.

TODO: Error Handling, Sanitize and Validate the zipcode before process.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zipcode_lookup. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

