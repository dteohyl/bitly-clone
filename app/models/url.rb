class Url < ActiveRecord::Base

	validates :url , uniqueness:true 

	def self.shorten
		SecureRandom.hex(3)
	end 


end
