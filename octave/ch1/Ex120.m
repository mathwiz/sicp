function Ex120
  gcd(206, 40)
  gcd(12, 6)
  gcd(60, 45)
endfunction

function VAL = gcd(a, b)
  if (b == 0)
    VAL = a;
  else
    printf("remainder %d %d\n", a, b);
    VAL = gcd(b, mod(a, b));
  endif
endfunction
