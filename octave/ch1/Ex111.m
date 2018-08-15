function Ex111
  recursive(6)
  iterative(6)
endfunction

function retval = recursive(n)
  if n < 3
    retval = n;
    return;
  else
    retval = recursive(n-1) + 2 * recursive(n-2) + 3 * recursive(n-3);
  endif
endfunction

function retval = iterative(n)
  if n < 3
    retval = n;
    return;
  else
    retval = helper(2, 1, 0, n);
  endif  
endfunction

function retval = single(a, b, c)
  retval = a + 2 * b + 3 * c;
endfunction

function retval = helper(a, b, c, n)
  if n == 3
    retval = single(a, b, c);
    return;
  else
    retval = helper(single(a, b, c), a, b, n - 1);
  endif  
endfunction
