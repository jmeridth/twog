

module BlogPostsHandler
  def get_new_blog_posts(posts, last_blog_post_tweeted)
    return [] unless posts && posts.length > 0
    return posts unless last_blog_post_tweeted
    new_posts = posts.reject { |post| Time.parse(post.updated.content.to_s) <= Time.parse(last_blog_post_tweeted.to_s) }
  end
end
