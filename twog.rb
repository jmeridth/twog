#!/usr/bin/env ruby
require 'rubygems'
require 'twitter_oauth'
require 'yaml'
require 'rss'

auth = YAML::load_file('auth.yaml')

rss_feed = "http://feeds.feedburner.com/lostechies.rss"
rss_content = ""
open(rss_feed) do |f|
  rss_content = f.read
end
rss = RSS::Parser.parse(rss_content, false)
rss.items.each do |item|
  puts item.link
  puts item.date
end

#client = TwitterOAuth::Client.new(:consumer_key => auth['consumer_key'], :consumer_secret => auth['consumer_secret'], :token => auth['access_token'], :secret => auth['access_secret'])
#puts "AUTHORIZED: #{client.authorized?}"



