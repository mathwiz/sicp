function Ex116
  expt(2,0)
  expt(2,9)
  expt(3,4)
  expt(3,5)  
endfunction

function VAL = expt(b, p)
  VAL = expt_inv(b, p, 1);
endfunction

function VAL = expt_inv(b, p, a)
  even = @(x) mod(x,2) == 0;
  
  if (p == 0)
    VAL = a;
  elseif (even(p))
    VAL = expt_inv(b*b, p/2, a);
  else
    VAL = expt_inv(b, p-1, a*b);
  endif
endfunction
