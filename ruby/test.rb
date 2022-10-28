require 'nokogiri'
require 'net/http'

URL = 'https://agriculture.house.gov/news/documentsingle.aspx?DocumentID=2106'

month = [ "DUMMY_OFFSET", "January", "February", "March","April","May","June","July","August","September","October","November","December" ]

uri = URI.parse(URL)

response = Net::HTTP.get_response(uri)

data = Nokogiri::HTML(response.body)

title = data.search('h2.newsie-titler').text
location_date = data.search('div.topnewstext').text

location = location_date.split(',')[0].strip
raw_date = location_date.split(',')[1].strip.split(' ')
year  = location_date.split(',')[2].strip
body_text =  data.search('div.bodycopy').text.strip

target_obj = {
    ":title" => title, 
    ":date" => "#{year}-#{month.find_index(raw_date[0].strip)}-#{raw_date[1]}", 
    ":location" => location, 
    ":article"=> body_text
}

puts target_obj
