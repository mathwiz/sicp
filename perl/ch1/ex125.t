#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);
use POSIX qw/floor/;

my $fast_times = 3;

sub divides {
    my ($a, $b) = @_;
    return 0 == $b % $a;
}

sub even {
    my ($n) = @_;
    return 0 == $n % 2;
}

sub sq {
    my ($n) = @_;
    return $n * $n;
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
    # return $n == smallest_divisor($n);
    return fast_prime($n, $fast_times);
}

sub fast_prime {
    my ($n, $times) = @_;
    if ($times == 0) {
        return 1;
    }
    elsif (fermat_test($n)) {
        return fast_prime($n, $times-1);
    }
    else {
        return 0;
    }
}

# Does it work now?
sub expmod {
    my ($base, $exp, $m) = @_;
    return fast_expt($base, $exp) % $m;
}

sub fast_expt {
    my ($base, $exp) = @_;
    if ($exp == 0) {
        return 1;
    }
    elsif (even($exp)) {
        return sq(fast_expt($base, $exp/2));
    }
    else {
        return ($base * fast_expt($base, $exp-1));
    }
}

sub fermat_test {
    my ($n) = @_;
    my $try_it = sub { 
        my ($a) = @_;
        return $a == expmod($a, $n, $n);
    };
    return $try_it->(1 + random($n-1));
}

sub random {
    my ($limit) = @_;
    return floor(rand() * $limit);
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

