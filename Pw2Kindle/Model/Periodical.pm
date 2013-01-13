package Pw2Kindle::Model::Periodical;
use Moose::Role;

requires qw(description homepage latest_url per_issue_url article_link_css_selector);

has 'title' => (
    is => 'ro',
    isa => 'Str',
);

sub getUrl {
    my ($self, $issue) = @_;

    return $self->latest_url if (!defined($issue));
    return sprintf($self->per_issue_url, $issue);
}

=head1 AUTHOR

Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 COPYRIGHT

Copyright (c) 2012, Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 LICENSE

Licensed under the BSD. See LICENSE for the full text.

=cut
1;
