require 'csv'
all_urls = []

CSV.foreach("db/urls.csv") do |row|
	row[0].gsub!(')','')
	row[0].gsub!(';','')
	row[0].gsub!('(','') 
	short_url = SecureRandom.hex(3)
	data = "'#{row[0]}', '#{short_url}'"
	all_urls << data 
end 

# # sql = "INSERT INTO urls (url) VALUES ("http://example.com/ea902c195bccda62d37bcdfa68")"

# # 
# Url.connection.execute sql
Url.transaction do 
	all_urls.each do |data|
		Url.connection.execute "INSERT INTO urls (url,short_url) VALUES (#{data})"
	end 
end 