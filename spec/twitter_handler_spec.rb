require File.dirname(__FILE__) + "/spec_helper"
require 'rubygems'
require 'rss'

describe TwitterHandler do 
  include TwogSpecHelper

  before(:each) do
    @posts = [rss_entry]
    @conf = test_conf
  end
  
  it "should do nothing if no posts are provided" do
    @twitter_handler = TwitterHandler.new(nil, @conf)
    @twitter_handler.tweet(nil)
    @twitter_handler.tweet([])
  end

  it "should throw exception if oauth consumer key isn't provided" do
    @conf['consumer_key'] = nil
    @twitter_handler = TwitterHandler.new(nil, @conf)
    lambda { @twitter_handler.tweet(@posts) }.should raise_error('OAuth Consumer Key missing')
  end
  
  it "should throw exception if oauth consumer secret isn't provided" do
    @conf['consumer_secret'] = nil
    @twitter_handler = TwitterHandler.new(nil, @conf)
    lambda { @twitter_handler.tweet(@posts) }.should raise_error('OAuth Consumer Secret missing')
  end
  
  it "should throw exception if oauth access token isn't provided" do
    @conf['access_token'] = nil
    @twitter_handler = TwitterHandler.new(nil, @conf)
    lambda { @twitter_handler.tweet(@posts) }.should raise_error('OAuth Access Token missing')
  end
 
  it "should throw exception if oauth access secret isn't provided" do
    @conf['access_secret'] = nil
    @twitter_handler = TwitterHandler.new(nil, @conf)
    lambda { @twitter_handler.tweet(@posts) }.should raise_error('OAuth Access Secret missing')
  end
  
  it "should shorten the blog post url with bitly when bitly handler is provided" do
    bitly_handler = mock 'bitly_handler'
    @twitter_handler = TwitterHandler.new(bitly_handler, @conf)
    bitly_handler.should_receive(:shorten)
    @twitter_handler.stub!(:use_twitter_oauth)
    @twitter_handler.stub!(:update_config_file_with_latest_tweet_date)
    @twitter_handler.tweet(@posts)
  end

  it "should make sure the text that is tweeted is at or less than 140 chars when the title is at or greater than 140 chars" do
    @twitter_handler = TwitterHandler.new(nil, @conf)
    text = @twitter_handler.ensure_text_is_of_length(140, "1234567890"*14, "http://bit.ly/Afr8s9") 
    text.should == "blogged: 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890 http://bit.ly/Afr8s9"
    text.length.should == 140
  end

  it "should make sure the text that is tweeted is at or less than 140 chars when the title is less than 140 chars" do
    @twitter_handler = TwitterHandler.new(nil, @conf)
    text = @twitter_handler.ensure_text_is_of_length(140, "1234567890", "http://bit.ly/Afr8s9") 
    text.should == "blogged: 1234567890 http://bit.ly/Afr8s9"
    text.length.should == 40
  end
end
