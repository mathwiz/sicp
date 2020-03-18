#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);


sub gcd {
    my ($a, $b) = @_;
    if ($b == 0) {
        return $a;
    }
    else {
        printf "remainder %d %d\n", $a, $b;
        return gcd($b, $a % $b);
    }
}


is(gcd(206, 40), 2);
is(gcd(60, 45), 15);
is(gcd(48, 12), 12);

done_testing();

