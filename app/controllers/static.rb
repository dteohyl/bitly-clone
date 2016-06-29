get '/' do
	@urls = Url.all
	@errors = params[:error_msg]
  	erb :"static/index"
end


post '/urls' do
	@urls = Url.all
	@url = Url.new(url: params[:long_url])
	# byebug
	if @url.save #it will go to app/models/url.rb go thru all the validation tests
	
		redirect '/'

	else
		@errors = "#{@url.errors.full_messages.join(" AND ")}"# this will display error message that u inserted in ur model validation test
		# erb :"static/index"
		redirect "/?error_msg=#{@errors}"
	end
end

get '/:short_url' do 
	@urls = Url.all
	@url = Url.find_by(short_url: params[:short_url])
	@url.increment(:click_count)
	@url.save  	

		if @url.url.match(/http[s]?/) == nil
			redirect "http://" + @url.url

		else
			redirect @url.url
		end   
end 