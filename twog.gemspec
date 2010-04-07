Gem::Specification.new do |s| 
  s.name       = "twog"
  s.version    = "0.1"
  s.author     = "Jason Meridth"
  s.email      = ""
  s.homepage   = "https://github.com/armmer/twog"
  s.platform   = Gem::Platform::RUBY
  s.summary    = "Tool to tweet blog posts, the twitterfeed killer"
  s.files      = FileList["{bin,lib}/**/*"].exclude("rdoc").to_a
  s.bindir     = "bin"
  s.executables = ["twog"]
  s.require_path      = "lib"
  s.has_rdoc          = false
  s.add_dependency "twitter_oauth"
  s.add_dependency "bitly"
end
