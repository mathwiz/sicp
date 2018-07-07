#!/usr/bin/perl
use strict;
use warnings;
use Test::More;


sub a_plus_abs_b_anon {
    my ($a, $b) = @_;
    ($b > 0 ? sub { $a + $b } : sub { $a - $b })->();
}

sub func_add { 
    (shift @_) + (shift @_)
}

sub func_sub { 
    (shift @_) - (shift @_)
}


sub a_plus_abs_b_named {
    my ($a, $b) = @_;
    ($b > 0 ? \&func_add : \&func_sub)->($a, $b);
}

sub a_plus_abs_b {
    a_plus_abs_b_named @_;
}

is (a_plus_abs_b (1,2), 3);
is (a_plus_abs_b (1,-2), 3);
is (a_plus_abs_b (-1,2), 1);
is (a_plus_abs_b (-1,-2), 1);

done_testing();

