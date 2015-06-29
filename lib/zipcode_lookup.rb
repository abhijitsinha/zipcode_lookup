require "zipcode_lookup/version"
require "lookup/google_lookup"
require "lookup/ziptastic_lookup"

module ZipcodeLookup
  def self.fetch_details(zip, options = {})
    ziptastic_response = Lookup::ZiptasticLookup.process(zip)
    return ziptastic_response unless ziptastic_response.error
    Lookup::GoogleLookup.process(zip, options)
  end
end
