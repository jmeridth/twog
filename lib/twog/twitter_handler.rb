require 'rubygems'
require 'twitter_oauth'
require 'yaml'
require 'rss'

class RSS::Atom::Feed::Entry
  def <=>(other_entry)
    this_time = Time.parse(self.updated.content.to_s)
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


class TwitterHandler
  def initialize(bitly_handler, conf)
    @bitly_handler = bitly_handler
    @conf = conf
  end

  def tweet(posts)
    return unless posts && posts.length > 0
    raise Exception.new('OAuth Consumer Key missing') unless consumer_key_exists?
    raise Exception.new('OAuth Consumer Secret missing') unless consumer_secret_exists?
    raise Exception.new('OAuth Access Token missing') unless access_token_exists?
    raise Exception.new('OAuth Access Secret missing') unless access_secret_exists?
    posts.sort.each do |item|
      link = @bitly_handler ? @bitly_handler.shorten(item.link.href) : item.link.href
      use_twitter_oauth(item, link)
      update_config_file_with_latest_tweet_date(item.updated.content.to_s)
    end
  end

  def use_twitter_oauth(item, link)
    client = TwitterOAuth::Client.new(
      :consumer_key => @conf['consumer_key'], 
      :consumer_secret => @conf['consumer_secret'], 
      :token => @conf['access_token'], 
      :secret => @conf['access_secret']
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

  def update_config_file_with_latest_tweet_date(last_blog_post_tweeted)
    @conf['last_blog_post_tweeted'] = last_blog_post_tweeted
    File.open("#{ENV['HOME']}/.twog.yaml","w") { |out| out.write(@conf.to_yaml) }
  end

  ['consumer_key','consumer_secret','access_token','access_secret'].each do |attr|
    define_method "#{attr}_exists?" do
      @conf["#{attr}"]
    end
  end
end
