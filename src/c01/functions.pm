package functions;
use strict;
use warnings FATAL => 'all';
use Exporter qw(import);

our @EXPORT_OK = qw(sum_sq);

sub sum_sq {
    my $sum = 0;
    foreach my $x (@_) {
        $sum += ($x * $x);
    }
    $sum;
}

1;