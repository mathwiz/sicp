inc = function(x) { return x + 1 };

dec = function(x) { return x - 1 };

plus_r = function(a, b) { return a == 0 ? b : inc(plus_r(dec(a), b)) };

plus_it = function(a, b) { return a == 0 ? b : plus_it(dec(a), inc(b)) };
