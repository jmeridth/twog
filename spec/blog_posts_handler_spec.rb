require File.dirname(__FILE__) + "/spec_helper"

describe BlogPostsHandler do 
  include TwogSpecHelper

  before(:each) do
    entry = rss_entry
    entry.updated.content = Time.new
    @posts = [entry]
  end
  
  it "should determine that there is one new blog post to tweet" do
    @blog_posts_handler = BlogPostsHandler.new(test_conf)
    posts = @blog_posts_handler.get_blog_posts(@posts)
    posts.length.should == 1
  end

  it "should return zero if posts are nil" do
    @blog_posts_handler = BlogPostsHandler.new(test_conf)
    posts = @blog_posts_handler.get_blog_posts(nil)
    posts.length.should == 0
  end
  
  it "should return zero if no posts are passed" do
    @blog_posts_handler = BlogPostsHandler.new(test_conf)
    posts = @blog_posts_handler.get_blog_posts([])
    posts.length.should == 0
  end

  it "should return the posts if there is no last_blog_post_tweeted in the conf file" do
    conf = test_conf
    conf['last_blog_post_tweeted'] = nil
    @blog_posts_handler = BlogPostsHandler.new(conf)
    posts = @blog_posts_handler.get_blog_posts(@posts)
    posts.length.should == 1
  end
end
