require File.join(File.dirname(__FILE__), "/../spec_helper")

describe BlogPostsHandler do
  include BlogPostsHandler

  before(:each) do
    post = Twog::Post.new(double('', pubDate: Time.now, link: 'http://tinyurl.com'))
    @posts = [post]
    @last_blog_post_tweeted = test_conf['last_blog_post_tweeted']
  end

  it "should determine that there is one new blog post to tweet" do
    posts = get_new_blog_posts(@posts, @last_blog_post_tweeted)
    expect(posts.length).to eq(1)
  end

  it "should return zero if posts are nil" do
    posts = get_new_blog_posts(nil, @last_blog_post_tweeted)
    expect(posts.length).to eq(0)
  end

  it "should return zero if no posts are passed" do
    posts = get_new_blog_posts([], @last_blog_post_tweeted)
    expect(posts.length).to eq(0)
  end

  it "should return the posts if there is no last_blog_post_tweeted in the conf file" do
    posts = get_new_blog_posts(@posts, nil)
    expect(posts.length).to eq(1)
  end

  it "should return zero posts if the date is older than the last blog post date tweeted" do
    post = Twog::Post.new(double('', pubDate: (Date.parse(@last_blog_post_tweeted.to_s) - 10).to_s, link: 'http://tinyurl.com'))
    @posts = [post]
    posts = get_new_blog_posts(@posts, @last_blog_post_tweeted)
    expect(posts.length).to eq(0)
  end
end
