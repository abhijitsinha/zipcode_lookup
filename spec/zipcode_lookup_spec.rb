require 'spec_helper'

describe ZipcodeLookup do
  subject { ZipcodeLookup }

  it 'has a version number' do
    expect(ZipcodeLookup::VERSION).not_to be nil
  end

  describe '#fetch_details' do
    it 'returns the zip from ziptastic' do
      ziptastic_hash = {"city"=>"San Francisco", "state"=>"California", "country"=>"United States"}
      allow_any_instance_of(Lookup::ZiptasticLookup).to receive(:api_request).and_return(ziptastic_hash.to_json)

      expect(ZipcodeLookup.fetch_details('94158').country).to eq('United States')
    end

    it 'returns the zip from google' do
      ziptastic_hash = {"error"=>"Zip cant be found."}
      allow_any_instance_of(Lookup::ZiptasticLookup).to receive(:api_request).and_return(ziptastic_hash.to_json)

      response = double('google', {country: 'India'})
      allow_any_instance_of(Lookup::GoogleLookup).to receive(:process).and_return(response)

      expect(ZipcodeLookup.fetch_details('94158').country).to eq('India')
    end
  end
end
