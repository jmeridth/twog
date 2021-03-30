# frozen_string_literal: true

module Twog
  module RssParser
    def parse_feed(rss_feed_url)
      raise StandardError, 'RSS feed missing' unless rss_feed_url

      rss = RSS::Parser.parse(get_content(rss_feed_url), false)
      rss.items
    end

    def get_content(rss_feed_url)
      open(rss_feed_url, &:read)
    end
  end
end
