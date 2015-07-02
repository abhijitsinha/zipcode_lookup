require 'spec_helper'

describe Lookup::ZiptasticLookup do
  describe 'Instance methods' do
    before :all do
      @zip = '94158'
      @ziptastic_lookup = described_class.new(@zip)
    end

    it 'returns the zip' do
      expect(@ziptastic_lookup.zipcode).to eq(@zip)
    end

    it 'returns the region key' do
      expect(@ziptastic_lookup.get_region).to eq('US')
    end

    it 'returns the parsed url' do
      expect(@ziptastic_lookup.parsed_url.class).to eq(URI::HTTP)
    end

    it '#search_url' do
      expect(@ziptastic_lookup.search_url).to eq("http://zip.getziptastic.com/v2/US/#{@zip}")
    end

    describe '#zipcode process' do
      before :each do
        ziptastic_hash = YAML.load_file(File.join(File.dirname(__FILE__), "fixtures/ziptastic_response.yml"))
        allow_any_instance_of(described_class).to receive(:api_request).and_return(ziptastic_hash.to_json)
      end

      it 'nil geo_details on empty response from ziptastic' do
        ziptastic_lookup = described_class.new('94158')
        ziptastic_lookup.response = "{}"

        expect(ziptastic_lookup.fetch_response).to eq({})
        expect(ziptastic_lookup.build_geo_details).to be_nil
      end

      it 'build_geo_details on a valid response' do
        ziptastic_lookup = described_class.new('94158')
        ziptastic_lookup.response = ziptastic_lookup.api_request

        expect(ziptastic_lookup.fetch_response).to eq({"city"=>"Mumbai", "state"=>"Maharastra", "country"=>"India"})
        expect(ziptastic_lookup.build_geo_details).not_to be_nil
      end

      it '#process' do
        geo_obj = described_class.new('94158').process
        expect(geo_obj.city).to     eq('Mumbai')
        expect(geo_obj.state).to    eq('Maharastra')
        expect(geo_obj.country).to  eq('India')
      end
    end
  end
end
