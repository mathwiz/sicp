package myutils;
use strict;
use warnings FATAL => 'all';
use Exporter qw(import);
use List::Util qw(reduce);

our @EXPORT_OK = qw(perl_list);

sub perl_list {
    my $elements = reduce { $a . (length ($a) == 0 ? "" : ",") . $b } "", @_;
    "($elements)";
}

1;