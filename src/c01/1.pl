use feature qw(say);

say 10;

say (5 + 3 + 4);

say (9-1);

say (6/2);

say ((2 * 4) + (4 - 6));

$a = 3;

$b = $a + 1;

say ($a + $b + $a * $b);

say ($a == $b);

say ($b > $a && ($b < ($a * $b)) ? $b : $a);

say ($a == 4 ? 6 : ($b == 4 ? 6 + 7 + $a : 25));

say (($b > $a ? $b : $a) + 2);

say (($a > $b ? $a : ($a < $b ? $b : -1)) * ($a + 1));
