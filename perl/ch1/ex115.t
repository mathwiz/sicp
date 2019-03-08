#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub p {
    my $n = shift;
    3 * $n - 4 * cube($n);
}

sub sine {
    my ($angle) = @_;
    if (abs($angle) < 0.1) {
        return $angle;
    }
    else {
        return p(sine($angle / 3.0));
    }
}

sub cube {
    my $n = shift;
    $n * $n * $n;
}

is(sine(0), 0);
say(sine(1));
say(sine(2));
say(sine(3.14 / 6));

done_testing();

