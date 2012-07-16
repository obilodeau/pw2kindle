# pw2kindle

Perl Weekly to Kindle

At the moment there's little to see here yet. We're doing this through an 
[instapaper][1] account.

## Excuses

I took the opportunity of starting something from scratch to try one of the 
perl CLI application frameworks (and then subsequently decided to go for the
Moose one). Sorry if this makes my application harder to install and to hack 
than it should ;)

## Installing

### Fedora

    # yum install perl-MooseX-App-Cmd perl-libwww-perl perl-LWP-Protocol-https \
      perl-HTML-TreeBuilder-XPath perl-HTML-Selector-XPath perl-Test-Simple \
      perl-parent perl-App-cpanminus perl-Crypt-SSLeay perl-Class-Base \
      perl-File-Slurp
    # cpanm Web::Query WWW::Instapaper::Client

### Other distros / OSes

Get all the detailed requirements (listed in their own section below) with cpanm.

## Detailed requirements

Using:

* Instapaper account

Running:

* File::Slurp
* MooseX::App::Cmd
* LWP::UserAgent
* LWP::Protocol::https
* HTML::TreeBuilder::XPath
* HTML::Selector::XPath
* Web::Query
* WWW::Instapaper::Client

Testing:

* Test::More
* Test::NoWarnings

## Usage

WARNING: This is really early and _will_ change!

### Prerequisite

Right now, the thing upload the specified Perl Weekly issue to your 
instapaper account. So, you need an instapaper account and you must configure
it for kindle delivery.

### Doing it

Exact help is available from:

    $ ./pw2kindle --help fetch

But roughly, what you want is:

    $ ./pw2kindle fetch --username <instapaper_username> --issue <perl_weekly_issue>

You'll be prompted for your instapaper password.

### References

* Information about the 'My Clippings' file: http://kindleworld.blogspot.ca/2010/01/q-on-kindles-my-clippings-file.html

[1]: http://www.instapaper.com/
