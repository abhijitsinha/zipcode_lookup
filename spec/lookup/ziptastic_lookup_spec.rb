require 'spec_helper'

describe Lookup::ZiptasticLookup do
  describe 'Instance methods' do
    before :all do
      @zip = '94158'
      @google_lookup = described_class.new(@zip)
    end

    it 'returns the zip' do
      expect(@google_lookup.zipcode).to eq(@zip)
    end

    it '#search_url' do
      expect(@google_lookup.search_url).to eq("http://zip.getziptastic.com/v2/US/#{@zip}")
    end

    describe '#zipcode process' do
      before :each do
        ziptastic_hash = YAML.load_file(File.join(File.dirname(__FILE__), "fixtures/ziptastic_response.yml"))
        allow_any_instance_of(described_class).to receive(:api_request).and_return(ziptastic_hash.to_json)
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
