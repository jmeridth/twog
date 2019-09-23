require File.join(File.dirname(__FILE__), "/../spec_helper")

describe RssParser do
  include RssParser

  it "should throw exception if rss_feed isn't provided" do
    expect{ parse_feed(nil)}.to raise_error('RSS feed missing')
  end

  it "should read the rss_feed_url and parse the items" do
    allow(self).to receive(:get_content).and_return(rss_feed_url_content)
    items = parse_feed('http://tinyurl.com')
    expect(items.length).to eq(1)
    expect(items[0].title.strip).to eq("Gocode Vim Plugin and Go Modules")
    expect(items[0].link.strip).to eq("https://blog.jasonmeridth.com/posts/gocode-vim-plugin-and-go-modules/")
  end
end
