require 'spec_helper'

describe Lookup::GoogleLookup do

  it 'has geo keys' do
    expect(described_class::GEO_HASH.keys).to match_array(%w(city state county country))
  end

  describe 'Instance methods' do
    before :all do
      @zip = '94158'
      @google_lookup = described_class.new(@zip)
    end

    it 'returns the zip' do
      expect(@google_lookup.zipcode).to eq(@zip)
    end

    it '#search_url' do
      expect(@google_lookup.search_url).to eq("http://maps.googleapis.com/maps/api/geocode/json?address=#{@zip}&region=&key=")
    end

    describe '#zipcode process' do
      before :each do
        google_hash = YAML::load_file(File.join(__dir__, 'fixtures/google_response.yml'))
        allow_any_instance_of(described_class).to receive(:api_request).and_return(google_hash.to_json)
      end

      it '#process' do
        geo_obj = described_class.new('400080').process
        expect(geo_obj.city).to     eq('Chongqing')
        expect(geo_obj.state).to    eq('Chongqing')
        expect(geo_obj.country).to  eq('China')
      end
    end
  end
end
