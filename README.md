# Team Cinco Cicadas


## Setup

Production
```
  bundle install --without=development --without=test
  RACK_ENV=production rake db:create
  RACK_ENV=production rake db:schema:load
  rackup
```

Development and Test
```
  bundle install
  rake db:create db:schema:load db:seed
```
NB: setup only adds seeds to the dev db.

To seed test database:
```
  RACK_ENV=test rake db:setup
```



This is already handled in rspec like so:
```ruby
ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.before(:suite) do
    rake['db:create'].execute
    rake['db:schema:load'].execute
  end

  config.before(:all) do
    Listing.delete_all
    rake['db:seed'].execute
  end
end
```


`rake db:setup` will wipe `makersbnb_test`. To reseed run ` RACK_ENV=test rake db:create`. This can still be run with a connection to the database.

Rspec will reseed the test db before each test.


## Branching
```
git branch #new_branch_name
git checkout #new_branch_name
```



## Timings:
9.30 Coffee
9.45 Check In  - TODO : out of ten. Set goals ? Plan the day ahead.
10.00 - 12.30 Morning Session
12.30 - 13.30 - Lunch.
13.30 - 13.40 - Meditation.
13.45 - 16.15 - Afternoon Session
4.15 Retro. - TODO : Out of ten. Review progress. Share problems we've found.


## Tech Stack:
Model: Postgres, Active_record
Controller: Rack, Sinatra App
Views: Javascript query
Testing: Rspec, Capybara, Travis CI (Jasmine not required atm)


## MVP

Listings site!

User stories:
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can list a new space

Wire frame:
- index.html - shows the current listings and a link to new listing
- list.html - form to generate a new listing.
- users/new - form to sign up
- sessions/new - form to sign in



Information Gathered:
  - Name
  - Description (tell the silly users to include contact details)
  - Price per night
  - Start date
  - End date



User Journey:
1. User heads to main page. Can see current listings and link to new listing saying 'List your Space'
2. User clicks link and is taken to a new page with a listing form to fill.
3. User fills form (see above) and clicks submit. 'Submit'
4. Fields are validated, on page message shown if successful. 'Return to Listings'
5. User clicks link to go back to homepage and see's listing



Technical Notes:

This is not included in v1 but should be taken into consideration to allow extensibility of product.

Validation:
  - Name : length < 255 characters
  - Description : length < 3500 characters
  - Price per night : is a number (xxxx.xx)
  - End date is after start date.

Tables:
listing (id serial primary key ,name varchar(255),description varchar(255), price_per_night decimal(5,2) ,start_date ,end_date)
dates available? (id serial primary key , listing_id integer ,start_date date ,end_date  date)


## Wire frames
![Image of Listing Wireframe](https://raw.githubusercontent.com/dtrts/makersbnb/master/images/listing_wireframe.png)




First Test?

Hello world.


Sign-up moved to v2.

## Appendix

Fun display of git history
```
git log --oneline --graph
```

Using bcrypt for password storage
https://github.com/codahale/bcrypt-ruby


Adding a new table:
 - Add create_table #{table_name} to ./db/schema.rb
 - Create ./models/#{table_name}.rb
 - Add require_relative './models/#{table_name}.rb' to ./app.rb
 - Add require_relative '../models/#{table_name}.rb' to ./spec/irb_helper.rb
 - Add seed records for testing in ./db/seed.rb using active record methods.
 - Add Table.delete_all to ./spec/spec_helper.rb
 - Run `rake db:drop db:create db:schema:load` to refresh the database structures


# MakersBnB specification

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline specifications

- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.

- Any signed-up user can list a new space.

- CC: Only signed-up users can list a space.
- CC: Add the username onto the listing


- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.

- CC: As a signed-up user i can approve a booking. Have a notification page.
- CC: Add booking functionality
- CC: Need database records for when something has been booked and by who, and has that been confirmed.
- CC: When signed in can see a 'Book' link on the listings. take to a page with a date selection. Submit it goes off to be approved.

- Until a user has confirmed a booking request, that space can still be booked for that night.
- CC: track booking requests. Cancel requests once one overlapping booking has been confirmed.
- CC: signed in user can see booking requests (incoming/outgoing) and booking confirmations.

- CC: UX design improvement





### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.