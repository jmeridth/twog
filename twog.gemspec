# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: twog 0.3.6 ruby lib

Gem::Specification.new do |s|
  s.name = "twog".freeze
  s.version = "0.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jason Meridth".freeze]
  s.date = "2021-03-30"
  s.description = "Tool to tweet blog posts".freeze
  s.email = ["jmeridth@gmail.com".freeze]
  s.executables = ["twog".freeze]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".github/FUNDING.yml",
    ".github/workflows/ruby.yml",
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "History.rdoc",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION.yml",
    "bin/twog",
    "lib/twog.rb",
    "lib/twog/blog_posts_handler.rb",
    "lib/twog/post.rb",
    "lib/twog/rss_entry_to_twog_post_mapper.rb",
    "lib/twog/rss_parser.rb",
    "lib/twog/twitter_handler.rb",
    "spec/spec_helper.rb",
    "spec/twog/blog_posts_handler_spec.rb",
    "spec/twog/post_spec.rb",
    "spec/twog/rss_entry_to_twog_post_mapper_spec.rb",
    "spec/twog/rss_parser_spec.rb",
    "spec/twog/twitter_handler_spec.rb",
    "spec/twog/twog_spec.rb",
    "twog.gemspec"
  ]
  s.homepage = "http://github.com/jmeridth/twog".freeze
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Tool to tweet blog posts".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<bitly>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<juwelier>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rack>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rss>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<twitter_oauth>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<whenever>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<bitly>.freeze, [">= 0"])
    s.add_dependency(%q<juwelier>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<rss>.freeze, [">= 0"])
    s.add_dependency(%q<twitter_oauth>.freeze, [">= 0"])
    s.add_dependency(%q<whenever>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end

