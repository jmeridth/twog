# frozen_string_literal: true

require File.join(File.dirname(__FILE__), '/../spec_helper')

describe TwitterHandler do
  include TwitterHandler

  before(:each) do
    @posts = [double('post', date: Time.now, link: 'http://bit.ly/Afr8s9')]
    @conf = test_conf
  end

  it 'should do nothing if no posts are provided' do
    tweet(nil, nil, nil)
    tweet([], nil, nil)
  end

  it 'should throw exception if oauth consumer key is not provided' do
    @conf['consumer_key'] = nil
    expect { tweet(@posts, @conf, nil) }.to raise_error('OAuth Consumer Key missing')
  end

  it 'should throw exception if oauth consumer secret is not provided' do
    @conf['consumer_secret'] = nil
    expect { tweet(@posts, @conf, nil) }.to raise_error('OAuth Consumer Secret missing')
  end

  it 'should throw exception if oauth access token is not provided' do
    @conf['access_token'] = nil
    expect { tweet(@posts, @conf, nil) }.to raise_error('OAuth Access Token missing')
  end

  it 'should throw exception if oauth access secret is not provided' do
    @conf['access_secret'] = nil
    expect { tweet(@posts, @conf, nil) }.to raise_error('OAuth Access Secret missing')
  end

  it 'should shorten the blog post url with bitly when bitly handler is provided' do
    bitly = double 'bitly'
    bitly_url = double 'bitly_url'
    allow(bitly).to receive(:shorten).and_return(bitly_url)
    allow(bitly_url).to receive(:short_url)
    allow(self).to receive(:use_twitter_oauth)
    allow(self).to receive(:update_config_file_with_latest_tweet_date)
    tweet(@posts, @conf, bitly)
  end

  it 'should make sure the text that is tweeted is at or less than 140 chars when the title is at or greater than 140 chars' do
    text = ensure_text_is_of_length(140, '1234567890' * 14, 'http://bit.ly/Afr8s9')
    expect(text).to eq('blogged: 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890 http://bit.ly/Afr8s9')
    expect(text.length).to eq(140)
  end

  it 'should make sure the text that is tweeted is at or less than 140 chars when the title is less than 140 chars' do
    text = ensure_text_is_of_length(140, '1234567890', 'http://bit.ly/Afr8s9')
    expect(text).to eq('blogged: 1234567890 http://bit.ly/Afr8s9')
    expect(text.length).to eq(40)
  end
end
