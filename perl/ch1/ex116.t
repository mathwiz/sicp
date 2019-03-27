#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub even {
    (shift @_) % 2 == 0;
}

sub expt_inv {
    my ($b, $p, $a) = @_;
    if ($p == 0) {
        return $a;
    }
    elsif (even($p)) {
        return expt_inv($b * $b, $p / 2, $a);
    }
    else {
        return expt_inv($b, $p - 1, $a * $b);
    }
}

sub expt {
    my ($b, $p) = @_;
    expt_inv($b, $p, 1);
}

isnt(even(1), 1);
is(even(2), 1);
is(expt(2, 0), 1);
is(expt(2, 9), 512);
is(expt(3, 4), 81);
is(expt(3, 5), 243);

done_testing();

