require 'rubygems'
require 'spec/rake/spectask'

namespace :conf do
  desc "Generate conf.yaml file"
  task :create do
    AUTH_FILE_NAME = File.expand_path(File.dirname(__FILE__) + "/lib/conf.yaml")
    
    AUTH_CONFIG_FILE = <<-EOS
  rss_feed: 'http://url.com/feed.rss'
  consumer_key: 'consumer key'
  consumer_secret: 'consumer secret'
  access_token: 'access token'
  access_secret: 'access secret'
  bitly_username: 'username'
  bitly_api_key: 'api key'
  last_blog_post_tweeted:
    EOS

    abort "conf.yaml already exists" if File.exists?(AUTH_FILE_NAME)

    File.open(AUTH_FILE_NAME, 'w') {|f| f.write(AUTH_CONFIG_FILE) } 
  end
end

desc "Run all specs in spec directory"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--color']
end

namespace :spec do
  desc "Run rcov on the spec files"
  Spec::Rake::SpecTask.new(:coverage) do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ['--color']
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end
end

desc "Clean out the coverage"
task :clean do
  rm_rf 'coverage'
end

