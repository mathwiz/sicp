function Ex106
  my_sqrt(3)
  my_sqrt(9)
  my_sqrt(16)
  my_sqrt(27)
  my_sqrt(64)
  # this results in max recursion depth
  bad_sqrt(3)
endfunction

function retval = my_sqrt(x)
  retval = sqrt_iter(1.0, x);
endfunction

function retval = sq(x)
  retval = x * x;
endfunction

function retval = average(x, y)
  retval = (x + y) / 2.0;
endfunction

function retval = is_good_enough(guess, x)
  retval = abs(sq(guess) - x) < (0.001);
endfunction

function retval = improve(guess, x)
  retval = average(guess, x / guess);
endfunction

function retval = sqrt_iter(guess, x)
  if is_good_enough(guess, x)
    retval = guess;
    return;
  else 
    retval = sqrt_iter(improve(guess, x), x);
  endif
endfunction

function retval = new_if(pred, then_clause, else_clause)
  if pred
    retval = then_clause;
    return;
  else
    retval = else_clause;
  endif
endfunction

function retval = bad_sqrt_iter(guess, x)
  retval = new_if(is_good_enough(guess, x), guess, bad_sqrt_iter(improve(guess, x), x));
endfunction

function retval = bad_sqrt(x)
  retval = bad_sqrt_iter(1.0, x);
endfunction


