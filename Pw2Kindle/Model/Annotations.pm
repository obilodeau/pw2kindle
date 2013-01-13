package Pw2Kindle::Model::Annotations;
use Moose;
use namespace::autoclean;

use File::Slurp;

has 'filename' => (
    is => 'ro',
    isa => 'Str',
    required => 1,
    default => 'My Clippings.txt',
);

has 'collection' => (
    is => 'rw',
    isa => 'HashRef[Pw2Kindle::Model::Annotation]',
    default => sub { {} },
);

# NOTE will probably need the concept of a 'device' soon

=head1 KINDLE ANNOTATION FORMAT

Your typical annotation looks like:

    Instapaper: Friday, Jul. 13 (Instapaper)
    - Highlight Loc. 758  | Added on Sunday, July 15, 2012, 03:44 AM

    and the wonderful Devel::Peek.
    ==========

First line is the document the highlight / note was taken from. Second line
is metadata on the annotation. Then there's a newline and the highlight or 
the note is on the following line. Finally ========== looks like a record
separator.

=cut
has '_documentLocation' => (is => 'ro', isa => 'Int', default => 0);
has '_metadataLocation' => (is => 'ro', isa => 'Int', default => 1);
has '_contentLocation' => (is => 'ro', isa => 'Int', default => 3);
has '_separator' => (is => 'ro', isa => 'Str', default => '==========');

=head1 METHODS

=over

=item parseCollection

Populates the collection attribute with:

  metadata => Pw2Kindle::Model::Annotation

for each annotation in the file.

=cut
sub parseCollection {
    my ($self) = @_;

    my @entries = split( $self->_separator, read_file($self->filename) );
}

sub _parseAnnotation {
    my ($self, $raw_annotation) = @_;

    my @annotation = split("\n", $raw_annotation);
    return Pw2Kindle::Model::Annotation->new(
        'document' => $annotation[$self->_documentLocation],
        'metadata' => $annotation[$self->_metadataLocation],
        'content' => $annotation[$self->_contentLocation],
    );
}

__PACKAGE__->meta->make_immutable;

package Pw2Kindle::Model::Annotation;
use Moose;
use namespace::autoclean;

has 'document' => (is => 'ro', isa => 'Str', required => 1);
has 'metadata' => (is => 'ro', isa => 'Str', required => 1);
has 'content' => (is => 'ro', isa => 'Str', required => 1);

__PACKAGE__->meta->make_immutable;

=back

=head1 AUTHOR

Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 COPYRIGHT

Copyright (c) 2012, Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 LICENSE

Licensed under the BSD. See LICENSE for the full text.

=cut
1;
