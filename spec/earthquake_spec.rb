require_relative '../lib/california'

describe 'Earthquake' do
  describe '.felt_by_la' do
    let(:feelable) {10.times.map {'Feelable Test City, CA'}}
    let(:quake_out_of_date_range) {'Not In Date Range Test City, CA'}
    let(:unfeelable) {'Not Feelable Test City, CA'}
    let(:earthquakes) do
      California::Earthquake.felt_by_la latest_date: Date.parse('2017-06-22'),
                                        oldest_date: Date.parse('2017-06-12')
    end

    before(:each) do
      path = File.join File.dirname(__FILE__), 'data/test_data.csv'
      allow(California::Earthquake).to receive(:csv_path).and_return(path)
    end

    it 'should return objects that are instances of Earthquake' do
      expect(earthquakes.first).to be_instance_of(California::Earthquake)
    end

    it 'should return array of feelable earthquakes only' do
      expect(earthquakes.map(&:place)).to eq(feelable)
    end

    it 'should return no more than 10 feelable earthquakes' do
      expect(earthquakes.size).to be(10)
    end

    it 'should not return any earthquakes that are not feelable' do
      expect(earthquakes.map(&:place)).not_to include(unfeelable)
    end

    it 'should not return any earthquakes that are not within date range' do
      expect(earthquakes.map(&:place)).not_to include(quake_out_of_date_range)
    end
  end
end
