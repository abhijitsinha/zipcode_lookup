require 'lookup/base'

module Lookup
  class GoogleLookup < Base
    GEO_HASH = {
      'city'     => 'locality',
      'state'    => 'administrative_area_level_1',
      'county'   => 'administrative_area_level_2',
      'country'  => 'country'
    }

    def search_url
      "http://maps.googleapis.com/maps/api/geocode/json?address=#{zipcode}&region=#{region}&key=#{api_key}"
    end

    def process
      super
      fetch_response
      build_geo_details
    end

    def fetch_response
      self.response = JSON.parse(response)['results'].first
    end

    def build_geo_details
      self.response_obj = OpenStruct.new(response)
      self.geo_obj      = OpenStruct.new
      GEO_HASH.keys.each do |key|
        address_component_value = fetch_address_component(GEO_HASH[key])
        geo_obj.send("#{key}=", address_component_value)
      end
      geo_obj
    end

    def fetch_address_component(component_name)
      component_name = response_obj.address_components.find { |x| x['types'].include?(component_name) }
      component_name and component_name['long_name']
    end
  end
end
