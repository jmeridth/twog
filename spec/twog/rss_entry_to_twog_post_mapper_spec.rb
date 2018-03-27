require File.join(File.dirname(__FILE__), "/../spec_helper")

describe RssEntryToTwogPostMapper do
  include RssEntryToTwogPostMapper

  it "should convert rss entries that have updated.content and link.href" do
    updated = stub('update', :content => '2010-04-02T01:00:00-06:00')
    link = stub('link', :href => 'http://tinyurl.com')
    post = stub('post', :updated => updated, :link => link)

    posts = (0..20).collect { |x| post }

    twog_posts = map(posts)
    expect(twog_posts.length).to eq(21)
    twog_posts.each do |p|
      expect(p.date).to eq("2010-04-02T01:00:00-06:00")
      expect(p.link).to eq("http://tinyurl.com")
    end
  end

  it "should convert rss entries that have pubDate and link" do
    post = stub('post', :pubDate => '2010-04-02T01:00:00-06:00', :link => 'http://tinyurl.com')
    posts = (0..20).collect { |x| post }

    twog_posts = map(posts)
    expect(twog_posts.length).to eq(21)
    twog_posts.each do |p|
      expect(p.date).to eq("2010-04-02T01:00:00-06:00")
      expect(p.link).to eq("http://tinyurl.com")
    end
  end
end
