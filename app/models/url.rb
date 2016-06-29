class Url < ActiveRecord::Base

	validates :url , uniqueness:{ case_sensitive: false}
	validates_format_of :url, with: /(http[s]?.*|w{3}.*)/, message: "format is invalid"
	# before_create :shorten
	before_create :shorten

	def shorten
		self.short_url = SecureRandom.hex(3)
	end 

	# def valid_url
	# 
	# 	if self.url.match(/(http[s]?.*|w{3}.*)/) == nil
	# 		errors.add(:url, "Invalid url!")
	# 		self.url = false 
	# 	end 
	# end 

end
