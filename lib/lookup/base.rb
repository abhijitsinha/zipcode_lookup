require 'net/http'
require 'ostruct'
require 'uri'
require 'json'

module Lookup
  class Base
    attr_accessor :api_key, :geo_obj, :region, :response,
      :response_obj, :zipcode

    def self.process(zipcode, options = {})
      new(zipcode, options).process
    end

    def api_request
      Net::HTTP.get(parsed_url)
    end

    def initialize(zipcode, options = {})
      @zipcode = zipcode
      @api_key = options[:api_key]
      @region  = options[:region]
    end

    def parsed_url
      URI.parse(search_url)
    end

    def process
      self.response = api_request
    end
  end
end
