require "crirc"
require "json"
require "http/client"

include Crirc::Protocol

if ARGV.size == 0
    puts("No config file was given!")
else
    puts("Configuration file informed! Connecting...")
end

token = JSON.parse(File.read(ARGV[0]))

client = Crirc::Network::Client.new nick: 
    token["twitch"]["account"].to_s, 
    ip: "irc.chat.twitch.tv", 
    port: 6697, 
    ssl: true, 
    pass: "oauth:#{token["twitch"]["token"].to_s}"

client.connect

commands = Hash(String, String).from_json(File.read("./commands/commands.json"))

client.start do |bot|
    bot.on_ready do
        bot.join Chan.new("#gutolanjoni")
    end.on("PING") do |msg|
        bot.pong(msg.message)
    end.on("PRIVMSG") do |msg|
        commands.each do |key,value|
            arg = msg.arguments if msg.arguments
            bot.reply msg, value if msg.message =~ /^#{key} */
        end
    end

    loop do
        m = bot.gets
        puts "> #{m}"
        break if m.nil?
        spawn { bot.handle(m.as(String)) }
    end
end
