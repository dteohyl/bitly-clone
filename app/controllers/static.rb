require 'byebug'
get '/' do
	@urls = Url.all
  erb :"static/index"
end


post '/urls' do
	@urls = Url.all
	@url = Url.new(url: params[:long_url], short_url: Url.shorten)
	@url.save
	redirect '/'
end

get '/:short_url' do 
	@urls = Url.all
	@url = Url.find_by(short_url: params[:short_url])
	@url.save

	redirect "http://" + @url.url

end 