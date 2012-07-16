
use strict;
use warnings;

use Test::More;
# disabled because of https://github.com/schwern/test-more/issues/16
#use Test::NoWarnings;

use FindBin;
use lib "$FindBin::Bin/..";

BEGIN {
    use_ok("Pw2Kindle::Model::Annotations");
}

=head1 TESTS

=over

=item blind test

=cut
my $parser = Pw2Kindle::Model::Annotations->new();
my $result = $parser->_parseAnnotation(<<'EOT');
Instapaper: Friday, Jul. 13 (Instapaper)
- Highlight Loc. 758  | Added on Sunday, July 15, 2012, 03:44 AM

and the wonderful Devel::Peek.
EOT
isa_ok($result, "Pw2Kindle::Model::Annotation");
is($result->document, 'Instapaper: Friday, Jul. 13 (Instapaper)', 'document attribute set');
is($result->metadata, '- Highlight Loc. 758  | Added on Sunday, July 15, 2012, 03:44 AM', 'metadata attribute set');
is($result->content, 'and the wonderful Devel::Peek.', 'content attribute set');

done_testing();

=back

=cut

=head1 AUTHOR

Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 COPYRIGHT

Copyright (c) 2012, Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 LICENSE

Licensed under the BSD. See LICENSE for the full text.
