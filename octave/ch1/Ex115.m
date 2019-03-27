function Ex115
  sine(0)
  sine(1)
  sine(2)
  sine(pi / 4)
  sine(pi / 6)
endfunction

function VAL = cube(x)
    VAL = x * x * x;
endfunction

function VAL = sine(angle)
  if abs(angle) < 0.1
    VAL = angle;
  else
    VAL = p(sine(angle / 3.0));
  endif
endfunction

function VAL = p(x)
  VAL = 3 * x - 4 * cube(x);
endfunction
