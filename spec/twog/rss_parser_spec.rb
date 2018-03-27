require File.join(File.dirname(__FILE__), "/../spec_helper")

describe RssParser do
  include RssParser

  it "should throw exception if rss_feed isn't provided" do
    expect(parse_feed(nil)).to raise_error('RSS feed missing')
  end

  it "should read the rss_feed_url and parse the items" do
    self.stub(:open).and_return(rss_feed_url_content)
    items = parse_feed(test_conf)
    expect(items.length).to eq(1)
    expect(items[0].title.content).to eq("Pair Programming")
    expect(items[0].link.href).to eq("http://blog.jasonmeridth.com/2009/01/29/pair-programming.html")
  end
end
