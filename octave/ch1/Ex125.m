function Ex125
  #search_for_primes(1000, 1020);
  search_for_primes(10000, 10040);
  #search_for_primes(100000, 100080);
  printf("done\n");
endfunction


function VAL = find_divisor(n, test)
  divides = @(a, b) rem(b, a) == 0;
  
  if (test * test > n)
    VAL = n;
  elseif (divides(test, n))
    VAL = test;
  else
    VAL = find_divisor(n, test + 1);
  endif
endfunction

function VAL = smallest_divisor(n) 
  VAL = find_divisor(n, 2);
endfunction

function VAL = search_for_primes(start, finish)
  n = start;
  if rem(start, 2) == 0
    n = n + 1;
  endif
  
  VAL = search_helper(n, finish);
endfunction

function VAL = search_helper(n, finish)
  range = n:2:finish;
  results = arrayfun(@prime, range);
  
  if n <= finish
    printf("%d %d\n", [range; results]);
  else
    printf("finished\n");
  endif
  
  VAL = finish;
endfunction

function VAL = prime(n)
  #VAL = n == smallest_divisor(n);
  VAL = fast_prime(n, 3);
endfunction

function VAL = fast_prime(n, times)
  if times == 0
    VAL = 1;
  elseif fermat_test(n)
    VAL = fast_prime(n, times-1);;
  else
    VAL = 0;
  endif
endfunction

# This also fails like in other non-lisps
function VAL = expmod(base, exp, m)
  VAL = rem(fast_expt(base, exp), m);
endfunction

function VAL = fast_expt(base, exp)
  even = @(n) rem(n, 2) == 0;
  square = @(n) n * n;
  if exp == 0
    VAL = 1;
  elseif even(exp)
    VAL = square(fast_expt(base, exp/2));
  else
    VAL = base * fast_expt(base, exp-1);
  endif
endfunction

function VAL = fermat_test(n)
  try_it = @(a) expmod(a, n, n) == a;
  VAL = try_it(1 + random(n-1));
endfunction

function VAL = random(limit)
  VAL = randi([0,limit]);
endfunction
