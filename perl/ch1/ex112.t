#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

sub pascal {
    my ($r, $n) = @_;
    ($n == 1 || $r == $n) ? 1 : pascal($r - 1, $n - 1) + pascal($r - 1, $n);
}

is(pascal(1, 1), 1);
is(pascal(2, 1), 1);
is(pascal(2, 2), 1);
is(pascal(3, 1), 1);
is(pascal(3, 2), 2);
is(pascal(3, 3), 1);
is(pascal(4, 1), 1);
is(pascal(4, 2), 3);
is(pascal(4, 3), 3);
is(pascal(4, 4), 1);

done_testing();

