require "rspec/core/rake_task"
require_relative 'lib/california'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :earthquake do
  desc 'Retrieves CSV from USGS and stores it in data/all_month.csv.'
  task :fetch_data do
    California::Earthquake.fetch_data
  end

  desc 'Outputs a list of up to 10 earthquakes.'
  task :felt_by_la, [:latest_date, :oldest_date] do |_, args|
    if args[:latest_date] && args[:oldest_date]
      params = {latest_date: Date.parse(args[:latest_date]),
                oldest_date: Date.parse(args[:oldest_date])}
      earthquakes = California::Earthquake.felt_by_la params
    else
      earthquakes = California::Earthquake.felt_by_la
    end
    earthquakes.each do |earthquake|
      puts ["time: #{earthquake.time}",
            "magnitude: #{earthquake.mag}",
            "distance: #{earthquake.distance}",
            "place: #{earthquake.place}"].join(', ')
    end
  end
end
