#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub even {
    (shift @_) % 2 == 0;
}

sub fib_iter {
    my ($a, $b) = @_;
    if ($b == 0) {
        return 0;
    }
    elsif (even($b)) {
        return 2 * fib_iter($a, $b / 2);
    }
    else {
        return $a + fib_iter($a, $b - 1);
    }
}

sub fib {
    my ($a, $b) = @_;
    fib_iter($a, $b);
}

isnt(even(1), 1);
is(even(2), 1);
is(fib(2, 0), 0);
is(fib(2, 9), 18);
is(fib(3, 4), 12);
is(fib(3, 5), 15);

done_testing();

