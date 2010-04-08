Gem::Specification.new do |s| 
  s.name       = "twog"
  s.version    = "0.0.1"

  s.author     = "Jason Meridth"
  s.date       = %q{2010-04-08}
  s.email      = %q{jmeridth@gmail.com}
  s.homepage   = %q{http://github.com/armmer/twog}

  s.platform   = Gem::Platform::RUBY
  s.summary    = %q{Tool to tweet blog posts}
  s.description = %q{Tool to tweet blog posts}
  s.rubyforge_project = %q{twog}
  s.rubygems_version = %q{1.3.5}

  s.files      = FileList["{bin,lib}/**/*"].exclude("rdoc").to_a
  s.bindir     = "bin"
  s.executables = ["twog"]
  
  s.require_paths     = ["lib"]
  s.has_rdoc          = false


  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<twitter_oauth>, [">= 0.3.3"])
      s.add_runtime_dependency(%q<bitly>, [">= 0.4.3"])
    else
      s.add_dependency(%q<twitter_oauth>, [">= 0.3.3"])
      s.add_dependency(%q<bitly>, [">= 0.4.3"])
    end
  else
    s.add_dependency(%q<twitter_oauth>, [">= 0.3.3"])
    s.add_dependency(%q<bitly>, [">= 0.4.3"])
  end
end
