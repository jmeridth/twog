require 'rubygems'
require 'yaml'
require 'twog/rss_parser'
require 'twog/blog_posts_handler'
require 'twog/twitter_handler'


class Twog
  extend RssParser
  extend BlogPostsHandler
  extend TwitterHandler

  def self.run(conf)
    posts = parse(conf['rss_feed'])
    posts = get_new_blog_posts(posts, conf['last_blog_post_tweeted'])
    return unless posts && posts.length > 0
    bitly = get_bitly_from(conf)
    tweet(posts, conf, bitly)
  end

  def self.get_bitly_from(conf)
    bitly_username = conf['bitly_username']
    bitly_api_key = conf['bitly_api_key']
    return nil unless (bitly_username && bitly_api_key)
    Bitly.new(bitly_username, bitly_api_key)
  end
end
