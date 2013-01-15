
use strict;
use warnings;

use Test::More;
# disabled because of https://github.com/schwern/test-more/issues/16
#use Test::NoWarnings;

use File::Slurp;
use FindBin;
use lib "$FindBin::Bin/..";

BEGIN {
    use_ok("Pw2Kindle::Model::Annotations");
}

my $here = $FindBin::Bin;

=head1 TESTS

=over

=item single annotation parser

Also loads important reference annotation.

=cut
my $ref_annotation;
{
    my $parser = Pw2Kindle::Model::Annotations->new();
    $ref_annotation = $parser->_parseAnnotation(
        scalar read_file("$here/data/simple-collection")
    );

    isa_ok($ref_annotation, "Pw2Kindle::Model::Annotation");
    is($ref_annotation->document, 'Instapaper: Friday, Jul. 13 (Instapaper)',
        'document attribute set'
    );
    is($ref_annotation->metadata,
        '- Highlight Loc. 758  | Added on Sunday, July 15, 2012, 03:44 AM',
        'metadata attribute set'
    );
    is($ref_annotation->content,
        'and the wonderful Devel::Peek.',
        'content attribute set'
    );
}

# TODO provoke a problem with =========== inside a note or highlight in a test case in a clipping file (t/data/)

=item collection parser

=cut
{
    my $annotations = Pw2Kindle::Model::Annotations->new( filename => "$here/data/simple-collection" );
    $annotations->parseCollection();
    # using an anon hashref to concat all the tests
    is_deeply( ${$annotations->collection}[0], $ref_annotation,
        'successfully parsed a simple collection'
    );
}

done_testing();

=back

=cut

=head1 AUTHOR

Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 COPYRIGHT

Copyright (c) 2012, 2013, Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 LICENSE

Licensed under the BSD. See LICENSE for the full text.
