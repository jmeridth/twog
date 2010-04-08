require 'rubygems'
require 'rss'

class RssParser

  def initialize(conf)
    raise Exception.new('RSS feed missing') unless conf['rss_feed']
    @rss_feed_url = conf['rss_feed']
  end

  def parse
    rss = RSS::Parser.parse(get_content, false)
    rss.items
  end

  def get_content
    rss_content = ""
    open(@rss_feed_url) do |f|
      rss_content = f.read
    end
    rss_content
  end
end
