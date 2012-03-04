# pw2kindle

Perl Weekly to Kindle

At the moment there's little to see here yet.

## Excuses

I took the opportunity of starting something from scratch to try one of the 
perl CLI application frameworks (and then subsequently decided to go for the
Moose one). Sorry if this makes my application harder to install and to hack 
than it should ;)

## Installing

### Fedora

    # yum install perl-MooseX-App-Cmd perl-libwww-perl perl-LWP-Protocol-https \
      perl-HTML-TreeBuilder-XPath perl-HTML-Selector-XPath perl-Test-Simple \
      perl-parent perl-App-cpanminus perl-Crypt-SSLeay perl-Class-Base
    # cpanm Web::Query WWW::Instapaper::Client

### Other distros / OSes

Get all the detailed requirements listed below with cpanm.

## Detailed requirements

Running:

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
