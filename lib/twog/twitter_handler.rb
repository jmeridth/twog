# frozen_string_literal: true

module Twog
  module TwitterHandler
    def tweet(posts, conf, bitly)
      return unless posts&.length&.positive?
      raise StandardError, 'OAuth Consumer Key missing' unless conf['consumer_key']
      raise StandardError, 'OAuth Consumer Secret missing' unless conf['consumer_secret']
      raise StandardError, 'OAuth Access Token missing' unless conf['access_token']
      raise StandardError, 'OAuth Access Secret missing' unless conf['access_secret']

      posts.sort.each do |post|
        link = bitly ? bitly.shorten(post.link).short_url : item.link
        use_twitter_oauth(post, link, conf)
        update_config_file_with_latest_tweet_date(post.date.to_s, conf)
      end
    end

    def use_twitter_oauth(post, link, conf)
      client = TwitterOAuth::Client.new(
        consumer_key: conf['consumer_key'],
        consumer_secret: conf['consumer_secret'],
        token: conf['access_token'],
        secret: conf['access_secret']
      )
      raise StandardError, 'TwitterOAuth unauthorized' unless client.authorized?

      text = ensure_text_is_of_length(140, post.title, link)
      client.update(text)
    end

    def ensure_text_is_of_length(length, title, link)
      blogged = 'blogged:'
      title = title[0, (length - ((' ' * 2).length + blogged.length + link.length))]
      [blogged, title, link].join(' ')
    end

    def update_config_file_with_latest_tweet_date(last_blog_post_tweeted, conf)
      conf['last_blog_post_tweeted'] = last_blog_post_tweeted
      File.open("#{ENV['HOME']}/.twog/conf.yaml", 'w') { |out| out.write(conf.to_yaml) }
    end
  end
end
