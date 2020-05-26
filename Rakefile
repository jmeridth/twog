require 'rubygems'
require 'rspec/core/rake_task'
require 'rubygems/package_task'
  
task :default => ['spec:coverage']

namespace :twog do
  desc "Clean out the coverage and the pkg"
  task :clean do
    rm_rf 'coverage'
    rm_rf 'pkg'
  end
end

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = ['--color']
end

namespace :spec do  
  desc "Run coverage on the spec files"
  RSpec::Core::RakeTask.new(:coverage) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
    spec.rspec_opts = ['--color']
    ENV['COVERAGE'] = "true"
  end
end

begin
  require 'juwelier'
  Juwelier::Tasks.new do |s|
    s.name = "twog"
    s.summary = %Q{Tool to tweet blog posts}
    s.email = ["jmeridth@gmail.com"]
    s.homepage = "http://github.com/jmeridth/twog"
    s.description = "Tool to tweet blog posts"
    s.authors = ["Jason Meridth"]
  end
rescue LoadError
  puts "Juwelier not available. Install it with: sudo gem install juwelier --version '>= 2.4.9'"
  exit(1)
end

