require 'rubygems'
require 'twitter_oauth'
require 'yaml'
require 'rss'
require 'bitly'

class RSS::Atom::Feed::Entry
  def <=>(other_entry)
    this_time = Time.parse(updated.content.to_s)
    other_time = Time.parse(other_entry.updated.content.to_s)
    if this_time < other_time
      -1
    elsif this_time > other_time
      1
    else
      0
    end
  end
end

module TwitterHandler
  def tweet(posts, conf, bitly)
    return unless posts && posts.length > 0
    raise Exception.new('OAuth Consumer Key missing') unless conf['consumer_key']
    raise Exception.new('OAuth Consumer Secret missing') unless conf['consumer_secret']
    raise Exception.new('OAuth Access Token missing') unless conf['access_token']
    raise Exception.new('OAuth Access Secret missing') unless conf['access_secret']
    posts.sort.each do |item|
      link = bitly ? bitly.shorten(item.link.href).short_url : item.link.href
      use_twitter_oauth(item, link, conf)
      update_config_file_with_latest_tweet_date(item.updated.content.to_s, conf)
    end
  end

  def use_twitter_oauth(item, link, conf)
    client = TwitterOAuth::Client.new(
      :consumer_key => conf['consumer_key'], 
      :consumer_secret => conf['consumer_secret'], 
      :token => conf['access_token'], 
      :secret => conf['access_secret']
    )
    raise Exception.new('TwitterOAuth unauthorized') unless client.authorized?
    text = ensure_text_is_of_length(140, item.title.content, link)
    client.update(text)
  end

  def ensure_text_is_of_length(length, title, link)
    blogged = "blogged:"
    title = title[0,(length-((" "*2).length+blogged.length+link.length))]
    [blogged, title, link].join(' ')
  end

  def update_config_file_with_latest_tweet_date(last_blog_post_tweeted, conf)
    conf['last_blog_post_tweeted'] = last_blog_post_tweeted
    File.open("#{ENV['HOME']}/.twog.yaml","w") { |out| out.write(conf.to_yaml) }
  end
end
