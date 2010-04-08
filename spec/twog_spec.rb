require File.dirname(__FILE__) + "/spec_helper"

describe Twog do 
  include TwogSpecHelper

  it "should not tweet if there are no new blog posts" do
    Twog.stub!(:parse).with(test_conf['rss_feed']).and_return(1)
    Twog.stub!(:get_new_blog_posts).with(1, test_conf['last_blog_post_tweeted']).and_return([])
    Twog.stub!(:tweet).and_return(1)
    result = Twog.run(test_conf)
    result.should be nil
  end
  
  it "should parse the rss feed and tweet new blog posts" do
    entry = rss_entry
    Twog.stub!(:parse).with(test_conf['rss_feed']).and_return(1)
    Twog.stub!(:get_new_blog_posts).with(1, test_conf['last_blog_post_tweeted']).and_return([entry])
    Twog.stub!(:get_bitly_from)
    Twog.stub!(:tweet).and_return(1)
    result = Twog.run(test_conf)
    result.should == 1
  end

  it "should return nil if bitly username is nil" do
    conf = test_conf
    conf['bitly_username'] = nil
    Twog.get_bitly_from(conf).should be nil
  end
  
  it "should return nil if bitly api key is nil" do
    conf = test_conf
    conf['bitly_username'] = nil
    Twog.get_bitly_from(conf).should be nil
  end

  it "should return nil if bitly api key is nil" do
    Bitly.stub!(:new).and_return("hello")
    Twog.get_bitly_from(test_conf).should == "hello"
  end
end
