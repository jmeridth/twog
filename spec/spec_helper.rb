# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), '/../lib')

require 'rubygems'
require 'twog'
require 'rss'
require 'simplecov'

include Twog

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

def test_conf
  @conf = { 'rss_feed' => 'rss feed',
            'bitly_username' => 'username',
            'bitly_api_key' => 'api key',
            'consumer_key' => 'consumerkey',
            'consumer_secret' => 'consumersecret',
            'access_token' => 'accesstoken',
            'access_secret' => 'accesssecret',
            'last_blog_post_tweeted' => '31 Mar 2010 07:52:17 -0600' }
end

def rss_feed_entry
  <<~EOS
      <item>
    <title>Gocode Vim Plugin and Go Modules</title>
    <description>
    <p><strong>Update</strong>: My friend <a href="https://twitter.com/_seemethere">Eli Uriegas</a> let me know that you don’t need <code class="highlighter-rouge">gocode</code> anymore since <code class="highlighter-rouge">vim-go</code> has autocompletion. I tested it out and he is correct. <a href="https://twitter.com/_seemethere/status/1081626050717728770">Here</a> is his tweet with a link to his dotfiles on how he sets up his <code class="highlighter-rouge">.vimrc</code> to use <code class="highlighter-rouge">vim-go</code></p> <p><em>Original Post:</em></p> <p>I recently purchased <a href="https://lets-go.alexedwards.net/">Let’s Go</a> from Alex Edwards. I wanted an end-to-end Golang website tutorial. It has been great. Lots learned.</p> <p>Unfortunately, he is using Go’s modules and the version of the gocode Vim plugin I was using did not support Go modules.</p> <h3 id="solution">Solution:</h3> <p>Use <a href="https://github.com/stamblerre/gocode">this fork</a> of the gocode Vim plugin and you’ll get support for Go modules.</p> <p>I use <a href="https://github.com/junegunn/vim-plug">Vim Plug</a> for my Vim plugins. Huge fan of Vundle but I like the post-actions feature of Plug. I just had to change one line of my vimrc and re-run updates.</p> <div class="language-diff highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="gh">diff --git a/vimrc b/vimrc index 3e8edf1..8395705 100644 </span><span class="gd">--- a/vimrc </span><span class="gi">+++ b/vimrc </span><span class="gu">@@ -73,7 +73,7 @@ endif </span> let editor_name='nvim' Plug 'zchee/deoplete-go', { 'do': 'make'} endif <span class="gd">- Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh' } </span><span class="gi">+ Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' } </span> Plug 'godoctor/godoctor.vim', {'for': 'go'} " Gocode refactoring tool " } </code></pre></div></div> <p>That is the line I had to change then run <code class="highlighter-rouge">:PlugUpdate!</code> and the new plugin was installed.</p> <p>I figured all of this out due to <a href="https://github.com/zchee/deoplete-go/issues/134#issuecomment-435436305">this comment</a> by <a href="https://github.com/cippaciong">Tommaso Sardelli</a> on Github. Thank you Tommaso.</p>
    </description>
    <pubDate>Sat, 05 Jan 2019 11:09:26 -0600</pubDate>
    <link>
    https://blog.jasonmeridth.com/posts/gocode-vim-plugin-and-go-modules/
    </link>
    <guid isPermaLink="true">
    https://blog.jasonmeridth.com/posts/gocode-vim-plugin-and-go-modules/
    </guid>
    <category>go</category>
    <category>vim</category>
    </item>
  EOS
end

def rss_entry
  rss = RSS::Parser.parse(rss_feed_url_content)
  rss.items[0]
end

def rss_feed_url_content
  rss_header = <<-EOS
  <rss xmlns:atom="http://www.w3.org/2005/Atom" version="2.0">
  <channel>
    <title>Learn, Converse, Share</title>
    <description>My Personal Blog</description>
    <link>https://blog.jasonmeridth.com/</link>
    <atom:link href="https://blog.jasonmeridth.com/feed.xml" rel="self" type="application/rss+xml"/>
    <pubDate>Fri, 01 Mar 2019 13:02:56 -0600</pubDate>
    <lastBuildDate>Fri, 01 Mar 2019 13:02:56 -0600</lastBuildDate>
    <generator>Jekyll v3.7.4</generator>
  EOS
  "#{rss_header}#{rss_feed_entry}</channel></rss>"
end
