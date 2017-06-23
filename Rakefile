require "rspec/core/rake_task"
require_relative 'lib/california'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :earthquake do
  desc 'Retrieves CSV from USGS and stores it in data/all_month.csv.'
  task :fetch_data do
    California::Earthquake.fetch_data
  end
end
