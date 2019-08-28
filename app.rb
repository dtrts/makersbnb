require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
# Active Record
require 'sinatra/activerecord'
require 'active_record'
require_relative './models/listing.rb'
require_relative './models/user.rb'

class MakersBnB < Sinatra::Base
  register Sinatra::Reloader
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension

  enable :sessions, :method_override

  set :public_folder, File.dirname(__FILE__) + '/public'

  get '/' do
    @user = User.find(session[:user_id]) if session[:user_id]
    @listings = Listing.all.order(:start_date)
    erb :index
  end

  get '/session/new' do
    erb :"session/new"
  end

  post '/session/new' do
    @user = User.find_by_username(params[:username])
    if @user
      session[:user_id] = @user.id if @user.password == params[:password]
    end
    redirect('/')
  end

  delete '/session' do
    session[:user_id] = nil
    redirect('/')
  end

  # get '/user/new' do
  #   erb :"user/new"
  # end

  # post '/user/new' do
  #   redirect('/')
  # end
end
