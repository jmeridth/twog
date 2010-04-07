require 'rubygems'
require 'yaml'

class Twog

  def initialize(rss_parser, blog_posts_handler, twitter_handler)
    @rss_parser = rss_parser
    @blog_posts_handler = blog_posts_handler
    @twitter_handler = twitter_handler
  end

  def run
    posts = read_rss_feed
    posts = determine_blog_posts_to_tweet(posts)
    tweet_new_blog_posts(posts)
  end

  def read_rss_feed
    @rss_parser.parse
  end

  def determine_blog_posts_to_tweet(posts)
    return [] unless posts && posts.length > 0
    @blog_posts_handler.get_blog_posts(posts)
  end

  def tweet_new_blog_posts(posts)
    return unless posts && posts.length > 0
    @twitter_handler.tweet(posts)
  end

end
