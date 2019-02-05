function Ex113
  fib(0)
  fib(1)
  fib(2)
  fib(3)
  fib(10)
  fib(15)
endfunction

function retval = fib(n)
  if n < 2
    retval = n;
    return;
  else
    retval = round((psi(n) - phi(n)) / sqrt(5));
  endif
endfunctionpp

function retval = psi(n)
  retval = ((1 + sqrt(5)) / 2) ^ n;
  return; 
endfunction

function retval = phi(n)
  retval = ((1 - sqrt(5)) / 2) ^ n;
  return; 
endfunction
