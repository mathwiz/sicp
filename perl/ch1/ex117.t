#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub even {
    (shift @_) % 2 == 0;
}

sub mult_inv {
    my ($a, $b) = @_;
    if ($b == 0) {
        return 0;
    }
    elsif (even($b)) {
        return 2 * mult_inv($a, $b / 2);
    }
    else {
        return $a + mult_inv($a, $b - 1);
    }
}

sub mult {
    my ($a, $b) = @_;
    mult_inv($a, $b);
}

isnt(even(1), 1);
is(even(2), 1);
is(mult(2, 0), 0);
is(mult(2, 9), 18);
is(mult(3, 4), 12);
is(mult(3, 5), 15);

done_testing();

