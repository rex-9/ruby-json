require 'net/http'
require 'httparty'
require "json"

### Fetch JSON from jsonplaceholder and save in JSON file

## Using HTTParty

url = 'https://jsonplaceholder.typicode.com/users'

response = HTTParty.get(url)

if response.code == 200
  data = JSON.parse(response.body)
  File.open('./data.json', 'w') do |file|
    file.puts(JSON.pretty_generate(data))
  end
else
  puts "Error: #{response.code} - #{response.message}"
end


## Using HTTP/Net

# url = URI.parse('https://jsonplaceholder.typicode.com/users')
# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true if url.scheme == 'https'

# request = Net::HTTP::Get.new(url.request_uri)
# response = http.request(request)

# if response.code == '200'
#   data = JSON.parse(response.body)
#   File.open('./data.json', 'w') do |file|
#     file.puts(JSON.pretty_generate(data))
#   end
# else
#   puts "Error: #{response.code} #{response.message}"
# end

# raw_data = File.read('./data.json')

### Read and Write the local file

# data = JSON.parse(raw_data)

# data.each do |obj|
#   obj["name"] += " Doe"
#   obj.transform_keys!(&:to_sym)
# end

# data.map do |obj|
#   obj[:age] += 18
#   obj[:address] = "Address: #{obj[:name]}, #{obj[:age]}" 
# end

# puts data

# File.open('./data.json', 'w') do |file|
#   file.puts(JSON.pretty_generate(data))
# end

