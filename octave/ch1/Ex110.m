function Ex110
  A(3,3)
  f(4)
  g(4)
  h(4)
  k(4)
endfunction

function retval = A(x, y)
  if y == 0
    retval = 0;
    return;
  elseif x == 0
    retval = 2 * y;
    return;
  elseif y == 1
    retval =  2;
    return;
  else
    retval = A(x - 1, A(x, y - 1));
  endif
endfunction

function retval = f(n)
  retval = A(0, n);
endfunction

function retval = g(n)
  retval = A(1, n);
endfunction

function retval = h(n)
  retval = A(2, n);
endfunction

function retval = k(n)
  retval = 5 * n * n;
endfunction


