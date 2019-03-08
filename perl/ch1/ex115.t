#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);

sub biggest_denomination {
    my $n = shift;
    if ($n == 1) {
        return 1;
    }
    elsif ($n == 2) {
        return 5;
    }
    elsif ($n == 3) {
        return 10;
    }
    elsif ($n == 4) {
        return 25;
    }
    elsif ($n == 5) {
        return 50;
    }
}


sub cc {
    my ($amount, $kinds_of_coins) = @_;
    if ($amount == 0) {
        return 1;
    }
    elsif ($amount < 0) {
        return 0;
    }
    elsif ($kinds_of_coins == 0) {
        return 0;
    }
    else {
        cc($amount, $kinds_of_coins-1) +
            cc($amount-biggest_denomination($kinds_of_coins), $kinds_of_coins)
    }
}

sub count_change {
    my $n = shift;
    cc($n, 5);
}

is(count_change(0), 1);
is(count_change(1), 1);
is(count_change(2), 1);
is(count_change(11), 4);
is(count_change(100), 292);

done_testing();

