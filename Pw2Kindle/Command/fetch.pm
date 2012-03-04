package Pw2Kindle::Command::fetch;
use Moose;
use Web::Query;

use Pw2Kindle::Model::Article;
 
extends qw(MooseX::App::Cmd::Command);

has dryrun => (
    isa => "Bool",
    is  => "rw",
    documentation => "no harm done. only outputs URL about to be parsed",

    # the following trait allows for the fancier options below
    traits    => [ 'Getopt' ],
    cmd_flag => 'dry-run',
    cmd_aliases   => 'd',
);

sub abstract { "performs fetch operation only" }

sub execute {
    my ( $self, $opt, $args ) = @_;

    $self->fetch();
}

=item fetch

=cut
# FIXME this method shouldn't return on it's own unless in debug / --dry-run
# TODO I should ask szabgab how best to pull the stuff to avoid breakage
sub fetch {
    my ( $self ) = @_;

    print "Fetching Perl Weekly issue...\n";
    # TODO request szabgab a link like latest.html redirects or symlinks to latest issue
    # TODO option to provide issue number

    my @articles;
    wq('http://perlweekly.com/archive/30.html')
        # <p class=entry> then <a ...> </p>
        ->find('p.entry>a')
        ->each(sub {
            my $i = shift;
            my $article = Pw2Kindle::Model::Article->new( 
                title => $_->text,
                url => $_->attr('href'),
            );

            # TODO verbose instead of --dry-run
            printf("%d) %s\n", $i+1, $article->toString()) if $self->dryrun;

            push @articles, $article
    });
    print "Done!\n";
    return @articles;
}

1;
