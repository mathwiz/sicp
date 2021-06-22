#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);


sub divides {
    my ($a, $b) = @_;
    return 0 == $b % $a;
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
        return find_divisor($n, $test + 1);
    }
}

sub smallest_divisor {
    my ($n) = @_;
    return find_divisor($n, 2);
}

sub is_prime {
    my ($n) = @_;
    return $n == smallest_divisor($n);
}

sub prime_test {
    my ($n) = @_;
    my($result) = is_prime($n) ? " *** " : "";
    printf("%d %s\n", $n, $result);
}

sub search_helper {
    my ($n, $end) = @_;
    if ($n <= $end) {
        prime_test($n);
        search_helper($n + 2, $end);
    }
    else {
        print("finished\n");
    }
}
sub search_for_primes {
    my ($start, $end) = @_;
    return search_helper(divides(2, $start) ? $start + 1 : $start, $end);
}


search_for_primes(1000, 1020); print("\n");
search_for_primes(10000, 10040); print("\n");
search_for_primes(100000, 100080); print("\n");

#done_testing();

