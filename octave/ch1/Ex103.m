pkg load miscellaneous


function larger_sqrs (x, y, z) 
  sqr = @(x) x^2

  sum_sqrs = @(xs) reduce(@(a,x) (a + sqr(x)), xs, 0)
  
  if (x <= y && x <= z)
    sum_sqrs([y z])
  elseif (y <= x && y <= z)
    sum_sqrs([x z])
  else
    sum_sqrs([y x])
  endif
endfunction
