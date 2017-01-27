class BookmarkManager < Sinatra::Base

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:user_email], params[:user_password])
  if user
    session[:user_id] = user.id
    redirect '/links'
  else
    flash.now[:errors] = "The email or password is incorrect"
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = "Goodbye!"
  redirect to '/links'
end

end
