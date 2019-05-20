package FaaSHandler;
use strict;
use warnings;

sub handle {
    my $st = shift;
    return "Hello $st !";
}

1;
