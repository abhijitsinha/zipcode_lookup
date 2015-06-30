# Zipcode Lookup 

Zipcode lookup retrieves geo-details from a valid zipcode. The gem is configured to lookup Ziptastic and Google Map API to fetch geo-details.

[<img src='https://travis-ci.org/abhijitsinha/zipcode_lookup.svg?branch=master'>](https://travis-ci.org/abhijitsinha/zipcode_lookup)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zipcode_lookup', '~> 0.1.0'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install zipcode_lookup

## Usage

###### [Ziptastic API](https://github.com/joshstrange/Ziptastic) 

    $ ZipcodeLookup.fetch_details(zip)

The code lookups to Ziptastic API to fetch details, if it fails or does not retrieve details - it lookups Google API. On successful lookup, a geo-object with city, state, country and county(if found) is returned.

###### Google API

Google being more accurate and support more regions but still chosen as secondary due to limited API calls available. You can use region_key(Region Biasing) to search or lookup more precisely.

##### Reason why this gem is created - 

1. Our application uses Master Table of ZipCodes, and we do lookup using that table.
2. But it was very difficult to accomodate all zips, thats why we created this gem to lookup zips which are not present in our database.

TODO: 
1. Error Handling.
2. Sanitize and Validate the zipcode before process.
3. Include more details from Ziptastic.
4. Performance Evaluation.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

