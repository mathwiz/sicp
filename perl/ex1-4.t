#!/usr/bin/perl
use strict;
use warnings;
use Test::More;


sub a_plus_abs_b {
    my ($a, $b) = @_;
    ($b > 0 ? sub { $a + $b } : sub { $a - $b })->();
}

is (a_plus_abs_b (1,2), 3);
is (a_plus_abs_b (1,-2), 3);
is (a_plus_abs_b (-1,2), 1);
is (a_plus_abs_b (-1,-2), 1);

done_testing();

