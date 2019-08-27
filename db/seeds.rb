# require 'active_record'
require_relative '../models/listing.rb'
Listing.create(name: 'Old Kent Road',
  description: 'Do not pass go',
  price_per_night: '0.50',
  start_date: '2019-02-01',
  end_date: '2019-04-25'
)
