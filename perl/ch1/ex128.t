#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);
use POSIX qw/floor/;

my $fast_times = 64;

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
    return $n == smallest_divisor($n);
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

sub expmod {
    my ($base, $exp, $m) = @_;
    if ($exp == 0) {
        return 1;
    }
    elsif (even($exp)) {
        return sq(expmod($base, $exp/2, $m)) % $m;
    }
    else {
        return ($base * expmod($base, $exp-1, $m)) % $m;
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

sub eq_expmod { 
    my ($a, $n) = @_;
    return $a == expmod($a, $n, $n);
}

sub car_helper {
    my ($n) = @_;
    for (my $i = $n; $i >= 0; $i--) {
        if ($i == 0) {
            return 1;
        } elsif (not eq_expmod($i, $n+1)) {
            return 0;
        }
    }
    return 0;
}

# cannot handle deep recursion
sub carmichael_num {
    my ($num) = @_;
    return (not is_prime($num)) && car_helper($num-1);
}

sub test_case {
    my ($n) = @_;
    my $p = is_prime($n) ? 1 : 0;
    my $fp = fast_prime($n, $fast_times) ? 1 : 0;
    my $cn = carmichael_num($n) ? 1 : 0;
    printf("%d \t Prime: %s \t Fast Prime: %s \t Carmichael Num: %s\n", $n, $p, $fp, $cn);
}


test_case(9);
test_case(10);
test_case(99);
test_case(11);
test_case(13);
test_case(97);
test_case(561);
test_case(1105);
test_case(1729);
test_case(2465);
test_case(2821);
test_case(6601);

#done_testing();

