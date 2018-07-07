#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/..";
use functions qw(delta_compare);

sub square {
    my $x = shift;
    $x * $x;
}

sub cube {
    my $x = shift;
    $x * $x * $x;
}

sub improve {
    my ($guess, $x) = @_;
    (2 * $guess + $x / square $guess) / 3.0;
}

sub is_good_enough {
    my ($guess, $x) = @_;
    abs (cube ($guess) - $x) < ($guess / 100000);
}

sub cbrt_iter {
    my ($guess, $x) = @_;
    is_good_enough ($guess, $x) ? $guess : cbrt_iter (improve ($guess, $x), $x);
}

sub my_cbrt {
    cbrt_iter (1.0, shift);
}

my $delta = 0.0001;
is (delta_compare (cube (my_cbrt (27.0)), 27.0, $delta), 1);
is (delta_compare (cube (my_cbrt (0.27)), 0.27, $delta), 1);

done_testing();

