# frozen_string_literal: true

# rubygems
require 'rubygems'

# 3rd party
require 'twitter_oauth'
require 'yaml'
require 'rss'
require 'bitly'

# internal requires
require 'twog/rss_parser'
require 'twog/rss_entry_to_twog_post_mapper'
require 'twog/blog_posts_handler'
require 'twog/twitter_handler'
require 'twog/post'

module Twog
  module Twog
    include RssParser
    include RssEntryToTwogPostMapper
    include BlogPostsHandler
    include TwitterHandler

    def run(conf)
      posts = get_posts_to_tweet(conf)
      return unless posts&.length&.positive?

      bitly = get_bitly_from(conf)
      tweet(posts, conf, bitly)
    end

    def get_posts_to_tweet(conf)
      posts = parse_feed(conf['rss_feed'])
      posts = map(posts)
      posts = get_new_blog_posts(posts, conf['last_blog_post_tweeted'])
    end

    def get_bitly_from(conf)
      bitly_username = conf['bitly_username']
      bitly_api_key = conf['bitly_api_key']
      return nil unless bitly_username && bitly_api_key

      Bitly.new(bitly_username, bitly_api_key)
    end

    def version
      yml = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), *%w[.. VERSION.yml])))
      "#{yml[:major]}.#{yml[:minor]}.#{yml[:patch]}"
    end
  end
end
