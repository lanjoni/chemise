 require "json"

commands = File.open("./commands.json") do |file|
    JSON.parse(file)
end

# puts json["!pong"].empty? ? json["!ping"] : "não encontrado"

commands.as_a.each_index do |index|
  puts commands[index]
end


#content = File.read("./commands.json")
#commands = Hash(String, String).from_json(File.read("./commands.json"))

#commands.each do |key, value|
#  puts "#{key} => #{value}"
#end

#commands.each do |key, value|
#  puts key
#end