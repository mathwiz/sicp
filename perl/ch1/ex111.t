#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

sub recursive {
    my $n = shift;
    $n < 3 ? $n : recursive($n-1) + 2 * recursive($n-2) + 3 * recursive($n-3);
}

sub iterative {
    my $n = shift;
    $n < 3 ? $n : helper(2, 1, 0, $n);
}

sub single {
    my ($a, $b, $c) = @_;
    $a + 2 * $b + 3 * $c;
}

sub helper {
    my ($a, $b, $c, $n) = @_;
    $n == 3 ? single($a, $b, $c) : helper(single($a, $b, $c), $a, $b, $n-1);
}

is(recursive(1), 1);
is(recursive(4), 11);
is(recursive(5), 25);
is(recursive(8), 335);

is(iterative(1), 1);
is(iterative(4), 11);
is(iterative(5), 25);
is(iterative(8), 335);

done_testing();

