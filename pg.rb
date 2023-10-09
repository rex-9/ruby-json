### Fetch JSON from jsonplaceholder and save in JSON file
require 'net/http'
require 'httparty'
require "json"

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

url = URI.parse('https://jsonplaceholder.typicode.com/users')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

request = Net::HTTP::Get.new(url.request_uri)
response = http.request(request)

if response.code == '200'
  data = JSON.parse(response.body)
  File.open('./data.json', 'w') do |file|
    file.puts(JSON.pretty_generate(data))
  end
else
  puts "Error: #{response.code} #{response.message}"
end

raw_data = File.read('./data.json')

### Read and Write the local file

data = JSON.parse(raw_data)

data.each do |obj|
  obj["name"] += " Doe"
  obj.transform_keys!(&:to_sym)
end

data.map do |obj|
  obj[:age] += 18
  obj[:address] = "Address: #{obj[:name]}, #{obj[:age]}" 
end

puts data

File.open('./data.json', 'w') do |file|
  file.puts(JSON.pretty_generate(data))
end


### EXERCISES
### 1
h = {a:1, b:2, c:3, d:4}

# puts h[:b]

h[:e] = 5

h.delete_if do |k, v|
  v < 3.5
end

# puts h

### 2
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each do |k, v|
  first_name = k.split[0].downcase
  contact_data.each do |contact|
    if contact[0].include? first_name
      v[:email] = contact[0]
      v[:address] = contact[1]
      v[:phone] = contact[2]
    end
  end
end

fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end

# puts contacts

### 3
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if do |item|
  item.start_with?('s')
end

# puts arr

### 4
a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']

a.map! do |item|
  item.split
end

a.flatten!

# puts a.size

### 5
name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}

# puts name_and_age.key? "Bob"
# puts name_and_age.value? 42

# bob = 
name_and_age.select do |name, age|
  # name == "Bob" && age == 42
  name == "Bob" || age == 31
end

# puts bob

# puts name_and_age.fetch("Bob")
# puts name_and_age["Bob"]

### 6

family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

# temp = []
# family.each do |k, v|
#   if k == :sisters || k == :brothers
#     temp << v
#   end
# end
# temp.flatten!
# puts temp

immediate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end

arr = immediate_family.values.flatten

p arr

