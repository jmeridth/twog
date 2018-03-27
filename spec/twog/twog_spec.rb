require File.join(File.dirname(__FILE__), '/../spec_helper')

describe Twog do
  include Twog::Twog

  it 'should not tweet if there are no new blog posts' do
    stub(:get_posts_to_tweet).with(test_conf).and_return([])
    stub(:tweet).and_return(1)
    result = run(test_conf)
    expect(result).to be_nil
  end

  it 'should parse the rss feed and tweet new blog posts' do
    entry = rss_entry
    stub(:get_posts_to_tweet).with(test_conf).and_return([entry])
    stub(:get_bitly_from)
    stub(:tweet).and_return(1)
    result = run(test_conf)
    expect(result).to eq(1)
  end

  it 'should return nil if bitly username is nil' do
    conf = test_conf
    conf['bitly_username'] = nil
    expect(get_bitly_from(conf)).to be_nil
  end

  it 'should return nil if bitly api key is nil' do
    conf = test_conf
    conf['bitly_username'] = nil
    expect(get_bitly_from(conf)).to be_nil
  end

  it 'should return nil if bitly api key is nil' do
    Bitly.stub(:new).and_return('hello')
    expect(get_bitly_from(test_conf)).to eq('hello')
  end

  it 'should get the version' do
    YAML.stub(:load).and_return({major: '1', minor:'0', patch: '0'})
    expect(version).to eq('1.0.0')
  end
end
