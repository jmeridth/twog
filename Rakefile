require 'rubygems'
require 'spec/rake/spectask'
require 'rake/gempackagetask'
  

namespace :twog do
  desc "Clean out the coverage and the pkg"
  task :clean do
    rm_rf 'coverage'
    rm_rf 'pkg'
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

begin
  gem 'jeweler', '>= 0.11.0'
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "twog"
    s.summary = %Q{Tool to tweet blog posts}
    s.email = ["jmeridth@gmail.com", "agilejoe@gmail.com"]
    s.homepage = "http://github.com/armmer/twog"
    s.description = "Tool to tweet blog posts"
    s.authors = ["Jason Meridth", "Joe Ocampo"]
    s.rubyforge_project = "twog"
    s.add_dependency('twitter_oauth', '>= 0.3.3')
    s.add_dependency('bitly', '>= 0.4.0')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler --version '>= 0.11.0'"
  exit(1)
end

