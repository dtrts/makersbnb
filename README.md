# Team Cinco Cicadas


## Setup

```
  bundle install

```

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

Wire frame:
2 pages
- index.html - shows the current listings and a link to new listing
- list.html - form to generate a new listing.



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
