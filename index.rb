require "json"

raw_data = File.read('./data.json')

data = JSON.parse(raw_data)
data.each do |obj|
  obj["name"] += " Doe"
  obj.transform_keys!(&:to_sym)
end

data.map do |obj|
  obj[:age] += 18
  obj[:address] = "Address: #{obj[:name]}, #{obj[:age]}" 
end

File.open('./data.json', 'w') do |file|
  file.puts(JSON.generate(data))
end
