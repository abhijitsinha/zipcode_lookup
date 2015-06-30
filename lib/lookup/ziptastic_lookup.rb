require 'lookup/base'

module Lookup
  class ZiptasticLookup < Base
    def search_url
      "http://zip.getziptastic.com/v2/US/#{zipcode}"
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
      OpenStruct.new(response)
    end
  end
end
