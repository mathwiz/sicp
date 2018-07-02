package functions;
use strict;
use warnings FATAL => 'all';
use Exporter qw(import);
use List::Util qw(reduce);

our @EXPORT_OK = qw(sum_squares);

sub sum_squares {
    reduce { $a + $b**2 } 0, @_;
}

1;