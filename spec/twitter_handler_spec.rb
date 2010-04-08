require File.dirname(__FILE__) + "/spec_helper"
require 'rubygems'
require 'rss'

describe TwitterHandler do 
  include TwogSpecHelper
  include TwitterHandler

  before(:each) do
    @posts = [rss_entry]
    @conf = test_conf
  end
  
  it "should do nothing if no posts are provided" do
    tweet(nil, nil, nil)
    tweet([], nil, nil)
  end

  it "should throw exception if oauth consumer key isn't provided" do
    @conf['consumer_key'] = nil
    lambda { tweet(@posts, @conf, nil) }.should raise_error('OAuth Consumer Key missing')
  end
  
  it "should throw exception if oauth consumer secret isn't provided" do
    @conf['consumer_secret'] = nil
    lambda { tweet(@posts, @conf, nil) }.should raise_error('OAuth Consumer Secret missing')
  end
  
  it "should throw exception if oauth access token isn't provided" do
    @conf['access_token'] = nil
    lambda { tweet(@posts, @conf, nil) }.should raise_error('OAuth Access Token missing')
  end
 
  it "should throw exception if oauth access secret isn't provided" do
    @conf['access_secret'] = nil
    lambda { tweet(@posts, @conf, nil) }.should raise_error('OAuth Access Secret missing')
  end
  
  it "should shorten the blog post url with bitly when bitly handler is provided" do
    bitly = mock 'bitly'
    bitly_url = mock 'bitly_url'
    bitly.should_receive(:shorten).and_return(bitly_url)
    bitly_url.should_receive(:short_url)
    self.stub!(:use_twitter_oauth)
    self.stub!(:update_config_file_with_latest_tweet_date)
    tweet(@posts, @conf, bitly)
  end

  it "should make sure the text that is tweeted is at or less than 140 chars when the title is at or greater than 140 chars" do
    text = ensure_text_is_of_length(140, "1234567890"*14, "http://bit.ly/Afr8s9") 
    text.should == "blogged: 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890 http://bit.ly/Afr8s9"
    text.length.should == 140
  end

  it "should make sure the text that is tweeted is at or less than 140 chars when the title is less than 140 chars" do
    text = ensure_text_is_of_length(140, "1234567890", "http://bit.ly/Afr8s9") 
    text.should == "blogged: 1234567890 http://bit.ly/Afr8s9"
    text.length.should == 40
  end
end
