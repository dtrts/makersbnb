# This will allow us to make changes to the database in interactive ruby.

require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'makersbnb_test')
require_relative '../models/listing.rb'
require_relative '../models/user.rb'
# load this in irb to interact with the dev db
