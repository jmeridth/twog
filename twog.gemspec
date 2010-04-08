# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twog}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Meridth"]
  s.date = %q{2010-04-08}
  s.default_executable = %q{twog}
  s.description = %q{Tool to tweet blog posts}
  s.email = %q{jmeridth@gmail.com}
  s.executables = ["twog"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION.yml",
     "bin/twog",
     "lib/twog.rb",
     "lib/twog/blog_posts_handler.rb",
     "lib/twog/rss_parser.rb",
     "lib/twog/twitter_handler.rb",
     "spec/blog_posts_handler_spec.rb",
     "spec/rss_parser_spec.rb",
     "spec/spec_helper.rb",
     "spec/twitter_handler_spec.rb",
     "spec/twog_spec.rb",
     "twog.gemspec"
  ]
  s.homepage = %q{http://github.com/armmer/twog}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{twog}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Tool to tweet blog posts}
  s.test_files = [
    "spec/blog_posts_handler_spec.rb",
     "spec/rss_parser_spec.rb",
     "spec/spec_helper.rb",
     "spec/twitter_handler_spec.rb",
     "spec/twog_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<twitter_oauth>, [">= 0.3.3"])
      s.add_runtime_dependency(%q<bitly>, [">= 0.4.0"])
    else
      s.add_dependency(%q<twitter_oauth>, [">= 0.3.3"])
      s.add_dependency(%q<bitly>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<twitter_oauth>, [">= 0.3.3"])
    s.add_dependency(%q<bitly>, [">= 0.4.0"])
  end
end

