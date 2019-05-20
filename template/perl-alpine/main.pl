use lib qw(function local/lib/perl5 function/local/lib/perl5);
use strict;
use warnings;

require FaaSHandler;

sub get_stdin {
    my $buf = "";
    while (<STDIN>) {
        $buf .= $_;
    }
    return $buf;
}

my $st = get_stdin();
print FaaSHandler::handle($st);
