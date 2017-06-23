require 'csv'

module California
  class Earthquake
    attr_reader :place, :time, :mag, :distance
    LA_LOCATION = {lat: 34.0522, long: -118.2437}

    def initialize(place:, time:, mag:, distance:)
      @place = place
      @time = time
      @mag = mag
      @distance = distance
    end

    class << self
      def felt_by_la(latest_date: Date.today, oldest_date: Date.today - 30)
        earthquakes = []
        CSV.foreach(csv_path, headers: true) do |quake|
          next unless meets_criteria_with? quake, latest_date, oldest_date
          earthquakes << new(place: quake['place'], time: quake['time'],
                             mag: quake['mag'], distance: distance_from(quake))
          break if earthquakes.size >= 10
        end
        earthquakes
      end

    private

      def meets_criteria_with?(quake, latest_date, oldest_date)
        quake_date = Date.parse quake['time']
        feelable?(quake) && quake_date.between?(oldest_date, latest_date)
      end

      def feelable?(quake)
        (quake['mag'].to_f * 100).round >= distance_from(quake)
      end

      def distance_from(quake)
        Distance.new(lat1:  LA_LOCATION[:lat],
                     long1: LA_LOCATION[:long],
                     lat2:  quake['latitude'].to_f,
                     long2: quake['longitude'].to_f).miles
      end

      def csv_path
        File.join File.dirname(__FILE__), '../../data/all_month.csv'
      end
    end
  end
end
