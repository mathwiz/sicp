#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

sub A {
    my ($x, $y) = @_;
    if ($y == 0) {
        return 0;
    }
    elsif ($x == 0) {
        return 2 * $y;
    }
    elsif ($y == 1) {
        return 2;
    }
    else {
        return A($x - 1, A($x, $y - 1));
    }
}

sub f {
    my $n = shift;
    return A(0, $n);
}

sub g {
    my $n = shift;
    return A(1, $n);
}

sub h {
    my $n = shift;
    return A(2, $n);
}

sub k {
    my $n = shift;
    return 5 * $n * $n;
}

is(A(1, 10), 1024);
is(A(2, 4), 65536);
is(A(3, 3), 65536);
is(f(4), 8);
is(f(78), 156);
is(g(4), 16);
is(h(4), 65536);

done_testing();

