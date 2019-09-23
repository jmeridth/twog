# Twog

[![Gem Version](https://badge.fury.io/rb/twog.png)](http://badge.fury.io/rb/twog)
[![Build Status](https://secure.travis-ci.org/jmeridth/twog.png?branch=master)](http://travis-ci.org/#!/jmeridth/twog)
[![Code Climate](https://codeclimate.com/github/jmeridth/twog.png)](https://codeclimate.com/github/jmeridth/twog)

By Jason Meridth

Twog is a simple application that parses an RSS feed and will tweet any posts it hasn't already tweeted.  Once you obtain OAuth access to a twitter account and provide it in the configuration and run Twog, it will tweet a prefix, your blog title, and a URL of the post.  There are also options of using Bit.ly for URL shortening and you can install Twog as a cron job for automated polling.

## Install

sudo gem install twog

## Writing to Twitter With OAuth

Please read [this](http://blog.jasonmeridth.com/2010/04/02/oauth.html) if you want to know how to get your Twitter OAuth consumer key/secret and access token/secret.

One you have those, run the command:

	twog --conf

and a hidden configuration file will be created in the your home folder (~/.twog/conf.yaml).  Once there, please fill it out with the information necessary to use this tool.

## Seeing What Will Be Tweeted

To see what will be Tweeted before it is, type:

	twog -o

or

	twog --output

## Shortening Blog Post URLs With Bitly API

In order to use Bitly for URL shortening, you'll need to go to [http://bit.ly](http://bit.ly) and click the [Sign Up](http://bit.ly/account/register?rd=/) link on the top right and get an account.  Once you are logged-in you click the [Account](http://bit.ly/account) link in the same top right area.  You will see your API Key in the middle of the page.

Put your bit.ly username and api key into the ~/.twog/conf.yaml file to be used in the code.

## Automating Polling With Cron

To install twog as a crontab job, run the command:

	twog --cronadd N

where N is the number of minutes you want twog to fire off every time.

To remove twog as a crontab job, run the command:

	twog --cronrm

[Crontab Info](http://www.unixgeeks.org/security/newbie/unix/cron-1.html) for all my non-*nix bretheren.

### Runtime Dependencies

* TwitterOauth: Writes tweets to Twitter (Ruby)
* Whenever: Sets up cron jobs (Ruby)
* Bitly: Shortens URLs (Ruby)

## Developer Dependencies

* RSpec: Test and Mocking framework (Ruby)

## TODO

Please check the [issues](http://github.com/jmeridth/twog/issues) on Github for future features or bugs that need to be fixed

## Contributors

* Matt Dietz ([cerberus98](http://github.com/cerberus98))  special thanks
* Chris MacGown ([ChristopherMacGown](http://github.com/ChristopherMacGown))
* Joe Ocampo ([agilejoe](http://github.com/agilejoe))

## Copyright

Copyright (c) 2019 Jason Meridth. See LICENSE for details.
