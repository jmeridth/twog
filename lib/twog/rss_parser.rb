module RssParser
  def parse(rss_feed_url)
    raise Exception.new('RSS feed missing') unless rss_feed_url
    rss = RSS::Parser.parse(get_content(rss_feed_url), false)
    rss.items
  end

  def get_content(rss_feed_url)
    open(rss_feed_url) do |f|
      f.read
    end
  end
end
