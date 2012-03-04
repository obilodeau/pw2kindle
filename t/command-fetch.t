
use strict;
use warnings;

use Test::More tests => 6;
use Test::NoWarnings;

use FindBin;
use lib "$FindBin::Bin/..";

BEGIN {
    use_ok("Pw2Kindle");
    use_ok("Pw2Kindle::Command::fetch");
    use_ok("Pw2Kindle::Model::Article");
}

=head1 TESTS

=over

=cut

=item fetch tests

=cut

my ($command) = Pw2Kindle::Command::fetch->prepare(Pw2Kindle->new());
my @articles = $command->fetch();
# TODO this is too limited
ok(@articles, "Fetched something");

=item instapaper tests

=cut
my $instapaper_ws = WWW::Instapaper::Client->new(
    username        => 'user@name.com', 
    password        => 'password',
);

# setup a test article
my $articles_ref = [
    Pw2Kindle::Model::Article->new( 
        title => q[World's best blog], 
        url => 'http://www.bottomlesspit.org/'
    ),
];

ok($command->publish($instapaper_ws, $articles_ref), "pushed an article");

=back

=cut
