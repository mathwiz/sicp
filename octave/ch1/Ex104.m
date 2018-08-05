function retval = Ex104 (a,b)
  f = ifelse(b >= 0, @(x,y) x + y, @(x,y) x - y);
  retvar = f(a,b)
endfunction

