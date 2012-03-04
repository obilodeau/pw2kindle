package Pw2Kindle::Model::Article;
use Moose;

has 'title' => (
    is => 'ro',
    isa => 'Str',
);

has 'description' => (
    is => 'ro',
    isa => 'Str',
);

has 'url' => (
    is => 'ro',
    isa => 'Str',
    required => 1,
);

sub toString {
   my ($self) = @_;

   return sprintf("%s\n%s\n", $self->title(), $self->url());
}

1;
