package Pw2Kindle::Model::PerlWeekly;
use Moose;

has 'title' => (
    is => 'ro',
    isa => 'Str',
    default => 'Perl Weekly',
);

has 'description' => (
    is => 'ro',
    isa => 'Str',
    default => 'A free, once a week e-mail round-up of hand-picked news and articles about Perl.',
);

has 'homepage' => (
    is => 'ro',
    isa => 'Str',
    default => 'http://perlweekly.com/',
);

has 'latest_url' => (
    is => 'ro',
    isa => 'Str',
    default => 'http://perlweekly.com/latest.html',
);

has 'per_issue_url' => (
    is => 'ro',
    isa => 'Str',
    default => 'http://perlweekly.com/archive/%s.html',
);

has 'article_link_css_selector' => (
    is => 'ro',
    isa => 'Str',
    default => 'p.entry>a',
    documentation => '<p class=entry> then <a ...> </p>',
);

with 'Pw2Kindle::Model::Periodical';

=head1 AUTHOR

Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 COPYRIGHT

Copyright (c) 2012, Olivier Bilodeau <olivier@bottomlesspit.org>

=head1 LICENSE

Licensed under the BSD. See LICENSE for the full text.

=cut
1;
