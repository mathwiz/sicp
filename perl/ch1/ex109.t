#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

sub inc {shift() + 1}

sub dec {shift() - 1}

sub plus_r {
    my ($a, $b) = @_;
    $a == 0 ? $b : inc(plus_r(dec($a), $b));
}

sub plus_it {
    my ($a, $b) = @_;
    $a == 0 ? $b : plus_it(dec($a), inc($b));
}

is(inc(1), 2);
is(dec(1), 0);
is(plus_r(2, 3), 5);
is(plus_it(2, 3), 5);

done_testing();

