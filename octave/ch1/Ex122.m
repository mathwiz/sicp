function Ex122
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
  VAL = n == smallest_divisor(n);
endfunction

