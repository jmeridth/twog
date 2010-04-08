require File.dirname(__FILE__) + "/spec_helper"

describe Twog do 
  include TwogSpecHelper


  it "should not tweet if there are no new blog posts" do
    rss_parser = mock('rss_parser')
    blog_handler = mock('blog_handler')
    twitter_handler = mock('twitter_handler')
    @twog = Twog.new(rss_parser, blog_handler, twitter_handler)
    rss_parser.should_receive(:parse).once.and_return([])
    blog_handler.should_not_receive(:get_blog_posts)
    twitter_handler.should_not_receive(:tweet)
    @twog.run
  end
  
  it "should parse the rss feed and tweet new blog posts" do
    posts = [mock('post', :title => 'title', :date => Time.new, :link => 'http://tinyurl')]
    rss_parser = mock('rss_parser')
    blog_handler = mock('blog_handler')
    twitter_handler = mock('twitter_handler')
    @twog = Twog.new(rss_parser, blog_handler, twitter_handler)
    rss_parser.should_receive(:parse).once.and_return(posts)
    blog_handler.should_receive(:get_blog_posts).with(posts).once.and_return(posts)
    twitter_handler.should_receive(:tweet).with(posts)
    @twog.run
  end
end
