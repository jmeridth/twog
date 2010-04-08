require File.dirname(__FILE__) + "/spec_helper"

describe RssParser do 
  include TwogSpecHelper

  before(:each) do
    @conf = test_conf
  end

  it "should throw exception if rss_feed isn't provided" do
    @conf['rss_feed'] = nil
    lambda { RssParser.new(@conf) }.should raise_error('RSS feed missing')
  end

  it "should read the rss_feed_url and parse the items" do
    @rss_parser = RssParser.new(@conf)
    @rss_parser.stub!(:get_content).and_return(rss_feed_url_content)
    items = @rss_parser.parse
    items.length.should == 1
    items[0].title.content.should == "Pair Programming"
    items[0].link.href.should == "http://blog.jasonmeridth.com/2009/01/29/pair-programming.html"
  end
end
