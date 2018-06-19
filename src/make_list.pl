#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use feature qw(say);
use List::Util qw(min);
use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname abs_path $0;
use myutils;
