class Url < ActiveRecord::Base

	validates :url , uniqueness:true 
	validate :valid_url

	def self.shorten
		SecureRandom.hex(3)
	end 

	def valid_url
		if self.url.match(/(http[s]?.*|w{3}.*)/) == nil
			errors.add(:url, "Invalid url!")
		end 
	end 

end
