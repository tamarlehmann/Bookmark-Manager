class BookmarkManager < Sinatra::Base

get '/links' do
  @links = Link.all
  erb :'links/index'
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

end
