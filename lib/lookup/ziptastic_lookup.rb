require 'lookup/base'

module Lookup
  class ZiptasticLookup < Base
    def build_geo_details
      return nil if response.empty?
      OpenStruct.new(response)
    end

    def fetch_response
      self.response = JSON.parse(response)
    end

    def get_region
      region || 'US'
    end

    def process
      super
      fetch_response
      build_geo_details
    end

    def search_url
      "http://zip.getziptastic.com/v2/#{get_region}/#{zipcode}"
    end
  end
end
