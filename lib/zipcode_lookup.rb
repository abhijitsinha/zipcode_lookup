require "zipcode_lookup/version"
require "lookup/google_lookup"
require "lookup/ziptastic_lookup"

module ZipcodeLookup
  def self.fetch_details(zip, options = {})
    ziptastic_response = Lookup::ZiptasticLookup.process(zip)
    ziptastic_response or Lookup::GoogleLookup.process(zip, options)
  end
end
