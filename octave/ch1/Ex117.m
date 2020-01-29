function Ex117
  mult(2,0)
  mult(2,9)
  mult(3,4)
  mult(3,5)  
endfunction

function VAL = mult(a, b)
  VAL = mult_inv(a, b, 0);
endfunction

function VAL = mult_inv(a, b, acc)
  even = @(x) mod(x,2) == 0;
  
  if (b == 0)
    VAL = acc;
  elseif (even(b))
    VAL = mult_inv(a*2, b/2, acc);
  else
    VAL = mult_inv(a, b-1, acc+a);
  endif
endfunction
