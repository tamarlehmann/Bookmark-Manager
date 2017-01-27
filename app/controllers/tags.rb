class BookmarkManager < Sinatra::Base

  get '/tags/:tag' do
    tag = Tag.first_or_create(:name => params[:tag])
    @links = tag.links
    erb :'links/index'
  end

end
