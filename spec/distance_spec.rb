require_relative '../lib/california'

describe 'Distance' do
  describe '.miles' do
    let(:distance) do
      California::Distance.new lat1:  34.0522,
                               long1: -118.2437,
                               lat2: 34.321,
                               long2: -116.8435
    end

    it 'should return the correct distance in miles' do
      expect(distance.miles).to be(82)
    end
  end
end
