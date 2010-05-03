module Twog
  class Post
    def initialize(post)
      @post = post
    end

    def link
      @post.link.respond_to?('href') ? @post.link.href : @post.link
    end

    def date
      @post.respond_to?('updated') ? @post.updated.content : @post.pubDate
    end
    
    def title
      @post.title.respond_to?('content') ? @post.title.content : @post.title
    end
    
    def <=>(other_post)
      Time.parse(self.date.to_s) <=> Time.parse(other_post.date.to_s)
    end
  end
end
