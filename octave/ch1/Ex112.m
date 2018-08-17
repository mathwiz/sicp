function Ex111
  ["row 1: " num2str(pascal(1,1))]
  ["row 2: " num2str(pascal(2,1)) " " num2str(pascal(2,2))]
  ["row 3: " num2str(pascal(3,1)) " " num2str(pascal(3,2)) " " num2str(pascal(3,3))]
  ["row 4: " num2str(pascal(4,1)) " " num2str(pascal(4,2)) " " num2str(pascal(4,3)) " " num2str(pascal(4,4))]
  ["row 5: " num2str(pascal(5,1)) " " num2str(pascal(5,2)) " " num2str(pascal(5,3)) " " num2str(pascal(5,4)) " " num2str(pascal(5,5))]
endfunction

function retval = pascal(r, n)
  if n == 1 || n == r
    retval = 1;
    return;
  else
    retval = pascal(r-1, n-1) + pascal(r-1, n);
  endif
endfunction
