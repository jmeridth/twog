require File.dirname(__FILE__) + "/spec_helper"

describe BlogPostsHandler do 
  include TwogSpecHelper
  include BlogPostsHandler

  before(:each) do
    entry = rss_entry
    entry.updated.content = Time.new
    @posts = [entry]
    @last_blog_post_tweeted = test_conf['last_blog_post_tweeted']
  end
  
  it "should determine that there is one new blog post to tweet" do
    posts = get_new_blog_posts(@posts, @last_blog_post_tweeted)
    posts.length.should == 1
  end

  it "should return zero if posts are nil" do
    posts = get_new_blog_posts(nil, @last_blog_post_tweeted)
    posts.length.should == 0
  end
  
  it "should return zero if no posts are passed" do
    posts = get_new_blog_posts([], @last_blog_post_tweeted)
    posts.length.should == 0
  end

  it "should return the posts if there is no last_blog_post_tweeted in the conf file" do
    posts = get_new_blog_posts(@posts, nil)
    posts.length.should == 1
  end
end
