#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub psi {
    my $n = shift;
    ((1 + sqrt(5)) / 2) ** $n;
}

sub phi {
    my $n = shift;
    ((1 - sqrt(5)) / 2) ** $n;
}

sub fib {
    my $n = shift;
    $n < 2 ? $n : int(0.5 + ((psi($n) - phi($n)) / sqrt(5)))
}

say psi(3);
say phi(3);
is(fib(0), 0);
is(fib(1), 1);
is(fib(2), 1);
is(fib(3), 2);
is(fib(4), 3);
is(fib(10), 55);
is(fib(15), 610);

done_testing();

