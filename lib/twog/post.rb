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
      this_time = Time.parse(self.date.to_s)
      other_time = Time.parse(other_post.date.to_s)
      if this_time < other_time
        -1
      elsif this_time > other_time
        1
      else
        0
      end
    end
  end
end
