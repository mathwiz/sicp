function Ex127
  test_case(10);
  test_case(11);
  test_case(17);
  test_case(561);
  test_case(1729);
  printf("done\n");
endfunction

function VAL = test_case(n)
  results = [prime(n), fast_prime(n, 128), carmichael_num(n)];
  printf("%d \t  Prime: %d \t Fast Prime: %d \t Carmichael: %d \n", [n, results]);
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

function VAL = eq_expmod(base, exp)
  VAL = expmod(base, exp, exp) == base;
endfunction

# recusrion depth problem with recursive call
# replace with iterative solution
function VAL = carmichael_num(n)
  try_it = @(a) expmod(a, n, n) == a;
  if prime(n)
    VAL = 0;
  else
    for i = n-1 : -1 : 0
      if i == 0
        VAL = 1;
        return;
      elseif  !try_it(i)
        VAL = 0;
        return;
      end
    endfor
  end
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

function VAL = expmod(base, exp, m)
  even = @(n) rem(n, 2) == 0;
  square = @(n) n * n;
  if exp == 0
    VAL = 1;
  elseif even(exp)
    VAL = rem(square(expmod(base, exp/2, m)), m);
  else
    VAL = rem(base * expmod(base, exp-1, m), m);
  endif
endfunction

function VAL = random(limit)
  VAL = randi([0,limit]);
endfunction
