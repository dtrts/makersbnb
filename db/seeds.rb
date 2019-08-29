# require 'active_record'
require_relative '../models/listing.rb'
require_relative '../models/user.rb'

Listing.create(
  name: 'Old Kent Road',
  description: 'Do not pass go \n#{address}\n#{phone number}\n#{email address}',
  price_per_night: '0.50',
  start_date: '2019-11-01',
  end_date: '2019-12-25',
  username: 'admin'
)

Listing.create(
  name: 'My House',
  description: 'Its in the middle of my street. No cats. \n#{address}\n#{phone number}\n#{email address}',
  price_per_night: '100.99',
  start_date: '2019-09-01',
  end_date: '2019-09-02',
  username: 'admin'
)
Listing.create(
  name: 'My Flat',
  description: 'Wonderful compact bolt-hole with mezzanino in Peeeeeenge. Penge East. \n#{address}\n#{phone number}\n#{email address}',
  price_per_night: '30',
  start_date: '2019-10-13',
  end_date: '2019-12-31',
  username: 'admin'
)

Listing.create(
  name: 'Super Chalet',
  description: 'Perfect for hoorah Henrys who want to pound the beers with the homies in rustic chic surroundings. \n#{address}\n#{phone number}\n#{email address}',
  price_per_night: '3000',
  start_date: '2020-02-01',
  end_date: '2020-02-13',
  username: 'admin'
)

# # User Seed
admin_account = User.new(
  username: 'admin',
  name: 'admin',
  email: 'email@address.com',
  telephone: '+441234567890'
)
admin_account.password = 'password'
admin_account.save!
