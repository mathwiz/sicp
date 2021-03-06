function Ex117
  mult(2,0)
  mult(2,9)
  mult(3,4)
  mult(3,5)  
endfunction

function VAL = mult(a, b)
  VAL = mult_inv(a, b);
endfunction

function VAL = mult_inv(a, b)
  even = @(x) mod(x,2) == 0;
  
  if (b == 0)
    VAL = 0;
  elseif (even(b))
    VAL = 2 * mult_inv(a, b/2);
  else
    VAL = a + mult_inv(a, b-1);
  endif
endfunction
