# require 'active_record'
require_relative '../models/listing.rb'
Listing.create(name: 'Old Kent Road',
  description: 'Do not pass go',
  price_per_night: '0.50',
  start_date: '2019-11-01',
  end_date: '2019-12-25'
)
Listing.create(
  name: 'My House',
  description: 'Its in the middle of my street. No cats.',
  price_per_night: '100.99',
  start_date: '2019-09-01',
  end_date: '2019-09-02'
)