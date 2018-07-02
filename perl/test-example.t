#!/usr/bin/perl
use strict;
use warnings;
use Test::More qw(no_plan);

do 'test-example.pl';

is(neg_val (), -1);
is(string_val (), "foo");

done_testing();

