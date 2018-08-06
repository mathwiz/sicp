function Ex108
  my_cbrt(3)
  my_cbrt(9)
  my_cbrt(16)
  my_cbrt(27)
  my_cbrt(64)
endfunction

function retval = my_cbrt(x)
  retval = cbrt_iter(1.0, x);
endfunction

function retval = sq(x)
  retval = x * x;
endfunction

function retval = cube(x)
  retval = x * x * x;
endfunction

function retval = is_good_enough(guess, x)
  retval = abs(cube(guess) - x) < (guess / 100000.0);
endfunction

function retval = improve(guess, x)
  retval = (x / sq(guess) + 2 * guess) / 3.0;
endfunction

function retval = cbrt_iter(guess, x)
  if is_good_enough(guess, x)
    retval = guess;
    return;
  else 
    retval = cbrt_iter(improve(guess, x), x);
  endif
endfunction
