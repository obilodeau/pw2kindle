package Pw2Kindle::Command::fetch;
use Moose;
 
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
 
    print "hello ";
    print "dry " if $self->dryrun;
    print "world?\n";
}

=item fetch

=cut
# what we are looking for here is for all <a> elements inside a <p class=subtitle...
# at some point I should ask szabgab how best to pull the stuff to avoid breakage
sub fetch {
}

1;
