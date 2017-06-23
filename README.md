# California

This is a command line utility to list up to 10 earthquakes that was possibly
felt by those in LA.

## Initial Setup

1. Use Ruby 2.4.1
2. Run `bundle install`
3. To obtain earthquake data, run `rake earthquake:fetch_data`.
4. The default `rake` command will run specs.

## Usage

1. Obtain the latest data if you haven't already done so by running `rake earthquake:fetch_data`.
2. Run `rake earthquake:felt_by_la` to print the first 10 quakes felt by LA, starting from the latest to oldest.
3. You can also specify two dates ranges for your earthquakes. You can do so by passing in the latest date as the first argument and the oldest date as the second argument in the following format, `rake earthquake:felt_by_la[YYYY-MM-DD,YYYY-MM-DD]`. For example:
    ```
    rake earthquake:felt_by_la[2017-06-20,2017-06-16]
    ```
