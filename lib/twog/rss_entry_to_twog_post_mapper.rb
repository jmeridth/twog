# frozen_string_literal: true

module Twog
  module RssEntryToTwogPostMapper
    def map(rss_entries)
      rss_entries.collect { |x| Post.new(x) }
    end
  end
end
