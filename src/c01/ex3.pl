#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use feature qw(say);
use List::Util qw(min);


sub larger_sq {
    my ($x,$y,$z) = @_;
    my $lowest = min($x,$y,$z);
    if ($lowest == $x) {
        return sum_sq ($y,$z);
    } elsif ($lowest == $y) {
        return sum_sq($x,$z);
    } else {
        return sum_sq($x,$y);
    }
}

sub sum_sq {
    my ($x,$y) = @_;
    ($x * $x) + ($y * $y);
}


say(larger_sq(1,2,3));
say(larger_sq(4,2,3));
say(larger_sq(4,5,3));
say(larger_sq(4,1,3));
