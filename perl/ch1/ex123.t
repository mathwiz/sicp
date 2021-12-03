#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);


sub divides {
    my ($a, $b) = @_;
    0 == $b % $a;
}

sub find_divisor {
    my ($n, $test) = @_;
    if ($test * $test > $n) {
        return $n;
    }
    elsif (divides($test, $n)) {
        return $test;
    }
    else {
        return find_divisor($n, next_num($test));
    }
}

sub next_num {
    my ($n) = @_;
    if ($n == 2) {
        return 3;
    } 
    else {
        return $n + 2;
    }
}

sub smallest_divisor {
    my ($n) = @_;
    return find_divisor($n, 2);
}


is(smallest_divisor(199), 199);
is(smallest_divisor(1999), 1999);
is(smallest_divisor(19999), 7);


done_testing();

