function Ex121
  printf("%d\n", smallest_divisor(199));
  printf("%d\n", smallest_divisor(1999));
  printf("%d\n", smallest_divisor(19999));
  printf("done\n");
endfunction


function VAL = find_divisor(n, test)
  divides = @(a, b) rem(b, a) == 0;
  
  if (test * test > n)
    VAL = n;
  elseif (divides(test, n))
    VAL = test;
  else
    VAL = find_divisor(n, test + 1);
  endif
endfunction

function VAL = smallest_divisor(n) 
  VAL = find_divisor(n, 2);
endfunction
