#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use functions qw(delta_compare);

sub square {
    my $x = shift;
    $x * $x;
}

sub average {
    my $x = shift;
    my $y = shift;
    ($x + $y) / 2.0;
}

sub improve {
    my ($guess, $x) = @_;
    average ($guess, $x / $guess);
}

sub is_good_enough {
    my ($guess, $x) = @_;
    abs (square ($guess) - $x) < ($guess / 100000);
}

sub sqrt_iter {
    my ($guess, $x) = @_;
    is_good_enough ($guess, $x) ? $guess : sqrt_iter (improve ($guess, $x), $x);
}

sub my_sqrt {
    sqrt_iter (1.0, shift);
}

my $delta = 0.00001;
is (delta_compare (my_sqrt (0.02), sqrt (0.02), $delta), 1);
is (delta_compare (my_sqrt (0.0002), sqrt (0.0002), $delta), 1);

done_testing();

