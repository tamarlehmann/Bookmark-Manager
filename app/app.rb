ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './app/dmconfig.rb'



require_relative 'server'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/links'
require_relative 'controllers/tags'

# start the server if ruby file executed directly
BookmarkManager.run! if $0 == 'app/app.rb'
