#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature qw(say);
use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname abs_path $0;
use myutils qw(perl_list);

is (length (" "), 1, "blank non-empty string");
is (perl_list (1,2), "(1,2)", "perl_list");

done_testing();

