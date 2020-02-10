#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub even {
    (shift @_) % 2 == 0;
}

sub mult_inv {
    my ($a, $b, $acc) = @_;
    if ($b == 0) {
        return $acc;
    }
    elsif (even($b)) {
        return mult_inv($a * 2, $b / 2, $acc);
    }
    else {
        return mult_inv($a, $b - 1, $acc + $a);
    }
}

sub mult {
    my ($a, $b) = @_;
    mult_inv($a, $b, 0);
}

isnt(even(1), 1);
is(even(2), 1);
is(mult(2, 0), 0);
is(mult(2, 9), 18);
is(mult(3, 4), 12);
is(mult(3, 5), 15);

done_testing();

