#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use functions qw(delta_compare);

sub square {
    my $x = shift;
    $x * $x;
}

sub average {
    my $x = shift;
    my $y = shift;
    ($x + $y) / 2.0;
}

sub improve {
    my ($guess, $x) = @_;
    average($guess, $x / $guess);
}

sub is_good_enough {
    my ($guess, $x) = @_;
    abs (square($guess) - $x) < 0.001;
}

sub sqrt_iter {
    my ($guess, $x) = @_;
    is_good_enough($guess, $x) ? $guess : sqrt_iter(improve($guess, $x), $x);
}

sub my_sqrt {
    sqrt_iter(1.0, shift);
}

sub new_if {
    my ($predicate, $then_clause, $else_clause) = @_;
    $predicate ? $then_clause : $else_clause;
}

sub bad_sqrt_iter {
    my ($guess, $x) = @_;
    new_if(is_good_enough($guess, $x), $guess, bad_sqrt_iter(improve($guess, $x), $x))
}

sub my_bad_sqrt {
    bad_sqrt_iter(1.0, shift);
}

my $delta = 0.001;
is (delta_compare(my_sqrt(2), 1.414, $delta), 1);
is (delta_compare(my_sqrt(9), 3.0, $delta), 1);
# fails with Deep recursion on subroutine "main::bad_sqrt_iter"
# is (delta_compare(my_bad_sqrt(9), 3.0, $delta), 1);

done_testing();

