#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);
use List::Util qw(min);
use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname abs_path $0;
use functions qw(sum_squares);

sub larger_sq {
    my ($x,$y,$z) = @_;
    my $lowest = min ($x,$y,$z);
    if ($lowest == $x) {
        return sum_squares ($y,$z);
    } elsif ($lowest == $y) {
        return sum_squares ($x,$z);
    } else {
        return sum_squares ($x,$y);
    }
}

is (sum_squares (), 0);
is (sum_squares (1), 1);
is (sum_squares (1,1), 2);
is (sum_squares (1,1,1), 3);
is (sum_squares (1,2,3,4), 30);
is (sum_squares (2,3,4), 29);
is (larger_sq(1,2,3), 13);
is (larger_sq(4,2,3), 25);
is (larger_sq(4,5,3), 41);
is (larger_sq(4,2,1), 20);
is (larger_sq(1,1,1), 2);

done_testing();

