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
    @user = User.find(session[:user_id]) if session[:user_id]
    erb :"session/new", layout: :"layouts/forms"
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

  get '/validate/new' do
    # 3. CHECK IF USERNAME IS DUPLICATE
    # 4. RETURN TRUE/FALSE
  end

  get '/user/new' do
    @user = User.find(session[:user_id]) if session[:user_id]
    erb :"user/new", layout: :"layouts/forms"
  end

  post '/user/new' do
    @user = User.new(
      username: params[:username],
      name: params[:name],
      email: params[:email],
      telephone: params[:telephone]
    )

    @user.password = params[:password]

    @user.save!

    session[:user_id] = @user.id

    redirect('/')
  end

  get '/listings/new' do
    @user = User.find(session[:user_id]) if session[:user_id]
    redirect('/') unless @user
    erb :list_space, layout: :"layouts/forms"
  end

  post '/listings/new' do
    @user = User.find(session[:user_id]) if session[:user_id]
    Listing.create(name: params[:name], description: params[:description], price_per_night: params[:price_per_night], start_date: params[:start_date], end_date: params[:end_date], username: @user.username)
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME

  # enable :method_override
end
