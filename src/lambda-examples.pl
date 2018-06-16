#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub a { print "Hello World!\n"; }

sub b {
    my $func = shift;
    $func->();
}

b(\&a);
