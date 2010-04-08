#!/usr/bin/env ruby

require 'rubygems'
require 'bitly'
require 'yaml'

require File.expand_path(File.dirname(__FILE__) + "/twog")
require File.expand_path(File.dirname(__FILE__) + "/twitter_handler")
require File.expand_path(File.dirname(__FILE__) + "/bitly_handler")
require File.expand_path(File.dirname(__FILE__) + "/rss_parser")
require File.expand_path(File.dirname(__FILE__) + "/blog_posts_handler")

raise Exception("please run 'rake gen_config' to create the auth.yaml file") unless File.exists?('conf.yaml')
conf = YAML.load_file('conf.yaml')

twog = Twog.new(RssParser.new(conf), 
  BlogPostsHandler.new(conf), 
  TwitterHandler.new(
    BitlyHandler.new(
      Bitly.new(conf['bitly_username'], conf['bitly_api_key'])), conf))
twog.run
