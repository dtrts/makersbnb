require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
# Active Record
require 'sinatra/activerecord'
require 'active_record'

class MakersBnB < Sinatra::Base
  register Sinatra::Reloader
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :public_folder, File.dirname(__FILE__) + '/public'

  get '/' do
    'Hello World'
  end

  # enable :method_override
end
