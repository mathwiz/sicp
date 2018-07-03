#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

sub p {
    p();
}

sub test {
    my $x = shift;
    my $y = shift;
    $x == 0 ? 0 : $y;
}

#is (test(0, p()), 0); => Deep recursion on subroutine "main::p"

done_testing();
