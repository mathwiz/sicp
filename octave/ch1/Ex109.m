function Ex109
  plus_r(3,4)
  plus_r(4,3)
  plus_it(3,4)
  plus_it(4,3)
endfunction

function retval = inc(x)
  retval = x + 1;
endfunction

function retval = dec(x)
  retval = x - 1;
endfunction

function retval = plus_r(a, b)
  if a == 0
    retval = b;
    return;
  else
    retval = inc(plus_r(dec(a), b));
  endif
endfunction

function retval = plus_it(a, b)
  if a == 0
    retval = b;
    return;
  else
    retval = plus_it(dec(a), inc(b));
  endif
endfunction
