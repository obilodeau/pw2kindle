
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
my $test_user = 'username@domain.com';
my $test_password = 'password';

=item fetch tests

=cut

my ($command) = Pw2Kindle::Command::fetch->prepare(
    Pw2Kindle->new(), 
    ('-u' => $test_user, '-i' => 30 ),
);
my @articles = $command->fetch();
# TODO this is too limited
ok(@articles, "Fetched something");

=item instapaper tests

=cut
my $instapaper_ws = WWW::Instapaper::Client->new(
    username        => $test_user,
    password        => $test_password,
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

=head1 AUTHOR

Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 COPYRIGHT

Copyright (c) 2012, Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 LICENSE

Licensed under the BSD. See LICENSE for the full text.
