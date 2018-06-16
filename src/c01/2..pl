#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $exp = (5 + 4 + (2 - (3 - (6 + (4 / 5.0))))) / (3 * (6 - 2) * (2 - 7));
print "$exp\n";