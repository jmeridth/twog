require File.dirname(__FILE__) + "/spec_helper"

describe Twog::RssParser do 
  include TwogSpecHelper
  include Twog::RssParser

  it "should throw exception if rss_feed isn't provided" do
    lambda { parse_feed(nil) }.should raise_error('RSS feed missing')
  end

  it "should read the rss_feed_url and parse the items" do
    self.stub!(:open).and_return(rss_feed_url_content)
    items = parse_feed(test_conf)
    items.length.should == 1
    items[0].title.content.should == "Pair Programming"
    items[0].link.href.should == "http://blog.jasonmeridth.com/2009/01/29/pair-programming.html"
  end
end
