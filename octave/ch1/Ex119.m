function Ex119
  fib(0) == 0
  fib(1) == 1
  fib(2) == 1
  fib(3) == 2
  fib(5) == 5
  fib(6) == 8
  fib(15) == 610
endfunction

function VAL = fib(n)
  VAL = fib_iter(1, 0, 0, 1, n);
endfunction

function VAL = fib_iter(a, b, p, q, count)
  even = @(x) mod(x,2) == 0;
  
  if (count == 0)
    VAL = b;
  elseif (even(count))
    VAL = fib_iter(a, b, p*p + q*q, q*q + 2*p*q, count/2);
  else
    VAL = fib_iter(b*q + a*q + a*p, b*p + a*q, p, q, count-1);
  endif
endfunction
