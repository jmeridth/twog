require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Post do
  context "when rss entry has updated and link.href" do
    before(:each) do
      updated =double('update', content: '2010-04-02T01:00:00-06:00')
      link = double('link', href: 'http://tinyurl.com')
      title = double('title', content: 'test title')
      @post = double('post', updated: updated, link: link, title: title)

    end

    it "should return a link" do
      twog_post = Twog::Post.new(@post)
      expect(twog_post.date).to eq("2010-04-02T01:00:00-06:00")
    end

    it "should return a date" do
      twog_post = Twog::Post.new(@post)
      expect(twog_post.date).to eq("2010-04-02T01:00:00-06:00")
    end

    it "should return a title" do
      twog_post = Twog::Post.new(@post)
      expect(twog_post.title).to eq("test title")
    end

    it "should sort multiple posts" do
      unsorted = (1..10).sort_by { rand }.collect do |i|
        updated = double('update', content: (Time.now + (60*60*24*i)).to_s)
        link = double('link', href: 'http://tinyurl.com')
        post = double('post', updated: updated, link: link)
        Twog::Post.new(post)
      end
      sorted = unsorted.sort!
      expect(sorted.length).to eq(10)

      sorted.inject {|i, j| expect(Time.parse(i.date.to_s)).to be < Time.parse(j.date.to_s); j }
    end

    it "should leave meeting list alone if all the times are the same" do
      unsorted = (1..10).collect do |i|
        updated = double('update', content: (Time.now + (60*60*24*3)).to_s)
        link = double('link', href: 'http://tinyurl.com')
        post = double('post', updated: updated, link: link)
        Twog::Post.new(post)
      end
      sorted = unsorted.sort!
      expect(sorted.length).to eq(10)
      expect(sorted).to eq(unsorted)
    end
  end

  context "when rss entry has pubDate and link" do
    before(:each) do
      @post = double('post', pubDate: '2010-04-02T01:00:00-06:00', link: 'http://tinyurl.com')
    end

    it "should return a link" do
      twog_post = Twog::Post.new(@post)

      expect(twog_post.link).to eq("http://tinyurl.com")
      expect(twog_post.date).to eq("2010-04-02T01:00:00-06:00")
    end

    it "should sort multiple posts again" do
      unsorted = (1..10).sort_by { rand }.collect do |i|
        post = double('post', pubDate: (Time.now + (60*60*24*i)).to_s, link: 'http://tinyurl.com')
        Twog::Post.new(post)
      end
      sorted = unsorted.sort!
      expect(sorted.length).to eq(10)

      sorted.inject {|i, j| expect(Time.parse(i.date.to_s)).to be < Time.parse(j.date.to_s); j }
    end
  end
end
