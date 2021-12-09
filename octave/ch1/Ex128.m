function Ex128
  test_case(9);
  test_case(10);
  # don't know why primes are broken
  test_case(11);
  test_case(17);
  test_case(97);
  test_case(101);
  test_case(561);
  test_case(1105);
  test_case(1729);
  test_case(2465);
  test_case(2821);
  test_case(6601);
  printf("done\n");
endfunction

function VAL = test_case(n)
  results = [prime(n), fast_prime(n, 58), fast_miller_rabin(n, 58)];
  printf("%d \t  Prime: %d \t Fast Prime: %d \t Miller Rabin: %d \n", [n, results]);
endfunction

function VAL = find_divisor(n, test)
  divides = @(a, b) rem(b, a) == 0;
  
  if test * test > n
    VAL = n;
  elseif divides(test, n)
    VAL = test;
  else
    VAL = find_divisor(n, test + 1);
  endif
endfunction

function VAL = smallest_divisor(n) 
  VAL = find_divisor(n, 2);
endfunction

function VAL = prime(n)
  VAL = n == smallest_divisor(n);
  ## VAL = fast_prime(n, 3);
endfunction

function VAL = fermat_test(n)
  try_it = @(a) expmod(a, n, n) == a;
  VAL = try_it(1 + random(n-1));
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

function VAL = miller_rabin_test(n)
  try_it = @(a) miller_rabin_expmod(a, n-1, n) == 1;
  VAL = try_it(1 + random(n-1));
endfunction

function VAL = fast_miller_rabin(n, times)
  if times == 0
    VAL = 1;
  elseif miller_rabin_test(n)
    VAL = fast_miller_rabin(n, times-1);;
  else
    VAL = 0;
  endif
endfunction

function VAL = even(n)
  VAL = rem(n, 2) == 0;
endfunction

function VAL = square(n)
  VAL = n * n;
endfunction

function VAL = expmod(base, exp, m)
  if exp == 0
    VAL = 1;
  elseif even(exp)
    VAL = rem(square(expmod(base, exp/2, m)), m);
  else
    VAL = rem(base * expmod(base, exp-1, m), m);
  endif
endfunction

function VAL = non_trivial_square_root(x, square, modulus)
  result = (square == 1) && (x != 1) && (x != modulus-1);
  VAL = ifelse(result, 0, square);
endfunction

function VAL = miller_rabin_expmod(base, exp, m)
  helper = @(x) non_trivial_square_root(x, rem(square(x), m), m);
  if exp == 0
    VAL = 1;
  elseif even(exp)
    VAL = helper(miller_rabin_expmod(base, exp/2, m));
  else
    VAL = rem(base * miller_rabin_expmod(base, exp-1, m), m);
  endif
endfunction

function VAL = random(limit)
  VAL = randi([0,limit]);
endfunction
