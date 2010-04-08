require 'rubygems'
require 'twitter_oauth'
require 'yaml'

class BlogPostsHandler
  def initialize(conf)
    @latest_blog_post_tweeted = conf['last_blog_post_tweeted']
  end

  def get_blog_posts(posts)
    return [] unless posts && posts.length > 0
    return posts unless @latest_blog_post_tweeted
    new_posts = posts.reject { |post| Time.parse(post.updated.content.to_s) < Time.parse(@latest_blog_post_tweeted.to_s) }
  end
end
