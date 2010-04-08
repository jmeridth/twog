require File.dirname(__FILE__) + "/spec_helper"

describe BitlyHandler do 
  it "should shorten the blog post url to make it fit in the 140 character twitter restraint" do
    link = "http://iamalonglink.com"
    bitly = mock('bitly')
    short_link = mock('short_link')
    bitly.should_receive(:shorten).with(link).and_return(short_link)
    short_link.should_receive(:short_url)
    @bitly_handler = BitlyHandler.new(bitly)
    @bitly_handler.shorten(link)
  end
  
end
