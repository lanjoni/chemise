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

client.start do |bot|
    bot.on_ready do
        bot.join Chan.new("#gutolanjoni")
    end.on("PING") do |msg|
        bot.pong(msg.message)
    end.on("PRIVMSG", message: /^!test */) do |msg|
        test = msg.arguments if msg.arguments
        bot.reply msg, "working! 🤖" if test
    end.on("PRIVMSG", message: /^!chuck */) do |msg, match|
        response = HTTP::Client.get "https://api.chucknorris.io/jokes/random"
        chuck = JSON.parse(response.body.to_s)
        bot.reply msg, chuck["value"].to_s unless response.body.nil?
    end

    loop do
        m = bot.gets
        puts "> #{m}"
        break if m.nil?
        spawn { bot.handle(m.as(String)) }
    end
end
