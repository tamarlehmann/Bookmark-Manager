ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './app/dmconfig.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:user_email], password: params[:user_password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:error] = "Password and confirmation password do not match"
      erb :'/users/new'
    end
  end

  get '/links' do
    current_user
    @user_email = current_user ? @user.email : ""
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:link_title], url: params[:link_url])
    params[:link_tags].split(",").each {
      |tag|
      new_tag = Tag.first_or_create(:name => tag.strip.capitalize)
      link.tags << new_tag
    }
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    @tag = Tag.first(:name => params[:tag])
    @links = @tag.links
    erb :links
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
