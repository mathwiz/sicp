#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub even {
    (shift @_) % 2 == 0;
}

sub fib_iter {
    my ($a, $b, $acc) = @_;
    if ($b == 0) {
        return $acc;
    }
    elsif (even($b)) {
        return fib_iter($a * 2, $b / 2, $acc);
    }
    else {
        return fib_iter($a, $b - 1, $acc + $a);
    }
}

sub fib {
    my ($a, $b) = @_;
    fib_iter($a, $b, 0);
}

isnt(even(1), 1);
is(even(2), 1);
is(fib(2, 0), 0);
is(fib(2, 9), 18);
is(fib(3, 4), 12);
is(fib(3, 5), 15);

done_testing();

