require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Twog do 
  include Twog::Twog

  it "should not tweet if there are no new blog posts" do
    stub!(:get_posts_to_tweet).with(test_conf).and_return([])
    stub!(:tweet).and_return(1)
    result = run(test_conf)
    result.should be nil
  end
  
  it "should parse the rss feed and tweet new blog posts" do
    entry = rss_entry
    stub!(:get_posts_to_tweet).with(test_conf).and_return([entry])
    stub!(:get_bitly_from)
    stub!(:tweet).and_return(1)
    result = run(test_conf)
    result.should == 1
  end

  it "should return nil if bitly username is nil" do
    conf = test_conf
    conf['bitly_username'] = nil
    get_bitly_from(conf).should be nil
  end
  
  it "should return nil if bitly api key is nil" do
    conf = test_conf
    conf['bitly_username'] = nil
    get_bitly_from(conf).should be nil
  end

  it "should return nil if bitly api key is nil" do
    Bitly.stub!(:new).and_return("hello")
    get_bitly_from(test_conf).should == "hello"
  end
end
