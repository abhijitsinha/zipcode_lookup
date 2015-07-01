require 'lookup/base'

module Lookup
  class ZiptasticLookup < Base
    def search_url
      self.region ||= 'US'
      "http://zip.getziptastic.com/v2/#{region}/#{zipcode}"
    end

    def process
      super
      fetch_response
      build_geo_details
    end

    def fetch_response
      self.response = JSON.parse(response)
    end

    def build_geo_details
      return nil if response.empty?
      OpenStruct.new(response)
    end
  end
end
