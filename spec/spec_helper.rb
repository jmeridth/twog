$: << File.join(File.dirname(__FILE__), "/../lib")

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
  @conf = {'rss_feed' => 'rss feed',
    'bitly_username' => 'username',
    'bitly_api_key' => 'api key',
    'consumer_key' => 'consumerkey',
    'consumer_secret' => 'consumersecret',
    'access_token' => 'accesstoken',
    'access_secret' => 'accesssecret',
    'last_blog_post_tweeted' => '31 Mar 2010 07:52:17 -0600'}
end

def rss_feed_entry
  entry=<<-EOS
   <entry>
     <title>Pair Programming</title>
     <link href="http://blog.jasonmeridth.com/2009/01/29/pair-programming.html"/>
     <updated>2009-01-29T00:00:00-08:00</updated>
     <id>http://blog.jasonmeridth.com/2009/01/29/pair-programming</id>
     <content type="html">&lt;h1&gt;Pair Programming&lt;/h1&gt;
  &lt;p class=&quot;meta&quot;&gt;29 Jan 2009 &amp;#8211; San Antonio&lt;/p&gt;
  &lt;p&gt;I recently found this post, &lt;a href=&quot;http://blog.jayfields.com/2008/02/pair-programming-all-time.html&quot;&gt;Pair Programming all the time&lt;/a&gt;, by &lt;a href=&quot;http://blog.jayfields.com/&quot;&gt;Jay Fields&lt;/a&gt; and loved it.  I&amp;#8217;ve felt the same way about pair programming.&lt;/p&gt;
  &lt;blockquote&gt;
  &lt;p&gt;&amp;#8220;I define all the time (in terms of pairing) as when I&amp;#8217;m writing code that I&amp;#8217;m going to commit.&amp;#8221;&lt;/p&gt;
  &lt;/blockquote&gt;
  &lt;p&gt;That is perfect.  Common sense but stated explicitly.  I worked in an Agile shop for 2 1/2 years and the environment was setup to highlight pair programming.  Pictures and little explanation &lt;a href=&quot;http://www.lostechies.com/blogs/joe_ocampo/archive/2007/12/09/where-the-magic-happens-our-dev-lap.aspx&quot;&gt;here&lt;/a&gt; (Thanks Joe).  We even marked tasks in the stories as low (L) or high (H) to dictate whether a pair was necessary (this was decided during our modeling week by the two developers who tasked the story, but always up for discussion during the iteration).  It worked out pretty well.&lt;/p&gt;
  &lt;p&gt;I understand and have heard all the reasons to not pair program.  Sometimes it works and sometimes it doesn&amp;#8217;t.  I&amp;#8217;ve personally experienced the benefits.  You learn to work with different personalities and that can only benefit you in your professional career.  And, the obvious reason, is immediate code review.  But, as my friend Scott C. Reynolds &lt;a href=&quot;http://www.lostechies.com/blogs/scottcreynolds/archive/2009/01/23/on-teaching-learning-and-being-honest-with-ourselves.aspx&quot;&gt;says&lt;/a&gt; (more or less):&lt;/p&gt;
  &lt;blockquote&gt;
  &lt;p&gt;&amp;#8220;Not everyone is cut from the same cloth&amp;#8221;&lt;/p&gt;
  &lt;/blockquote&gt;
  &lt;p&gt;That is true and that is life.  I hope this helps someone understand that not all pair programming enthusiasts are zealots.   I know it&amp;#8217;s a fine line though.&lt;/p&gt;</content>
   </entry>
   EOS
   return entry
end

def rss_entry
  rss = RSS::Parser.parse(rss_feed_url_content)
  rss.items[0]
end

def rss_feed_url_content
  post=<<-EOS
  <?xml version="1.0" encoding="utf-8"?>
  <feed xmlns="http://www.w3.org/2005/Atom">
   
   <title>Jason Meridth</title>
   <link href="http://blog.jasonmeridth.com/atom.xml" rel="self"/>
   <link href="http://blog.jasonmeridth.com/"/>
   <updated>2010-04-04T13:15:31-07:00</updated>
   <id>http://blog.jasonmeridth.com/</id>
   <author>
     <name>Jason Meridth</name>
     <email>jmeridth@gmail.com</email>
   </author>
  EOS
  return "#{post}#{rss_feed_entry}"
end

