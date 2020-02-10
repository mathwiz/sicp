#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub even {
    (shift @_) % 2 == 0;
}

sub sq {
    my $x = shift @_;
    return $x * $x;
}

sub fib_iter {
    my ($a, $b, $p, $q, $count) = @_;
    if ($count == 0) {
        return $b;
    }
    elsif (even($count)) {
        return fib_iter($a, $b, sq($p) + sq($q), sq($q) + 2*$p*$q, $count / 2);
    }
    else {
        return fib_iter($b*$q + $a*$q + $a*$p, $b*$p + $a*$q, $p, $q, $count - 1);
    }
}

sub fib {
    my ($n) = @_;
    fib_iter(1, 0, 0, 1, $n);
}

is(fib(0), 0);
is(fib(1), 1);
is(fib(2), 1);
is(fib(3), 2);
is(fib(4), 3);
is(fib(5), 5);
is(fib(6), 8);
is(fib(15), 610);

done_testing();

