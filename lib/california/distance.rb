module California
  class Distance
    attr_reader :lat1, :lat2, :long1, :long2

    def initialize(lat1:, long1:, lat2:, long2:)
      @lat1 = lat1
      @lat2 = lat2
      @long1 = long1
      @long2 = long2
    end

    def miles
      haversine
    end

  private

    def haversine
      radius = 3959
      a = (Math.sin(radians(delta(lat1, lat2) / 2)) ** 2) +
          Math.cos(radians(lat1)) * Math.cos(radians(lat2)) *
          (Math.sin(radians(delta(long1, long2)) / 2) ** 2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      (radius * c).round
    end

    def delta(degree1, degree2)
      degrees = [degree1, degree2].sort
      degrees[1] - degrees[0]
    end

    def radians(degrees)
      degrees * Math::PI / 180
    end
  end
end
