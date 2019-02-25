function Ex114
  count_change(0)
  count_change(1)
  count_change(2)
  count_change(11)
  count_change(100)
endfunction

function retval = count_change(amount)
    retval = cc(amount, 5);
endfunction

function retval = cc(amount, kinds_of_coins)
  if amount == 0
    retval = 1;
  elseif amount < 0
    retval = 0;
  elseif kinds_of_coins == 0
    retval = 0;
  else
    retval = cc(amount, kinds_of_coins-1) + \
    cc(amount-biggest_denomination(kinds_of_coins), kinds_of_coins);
  endif
endfunction

function VAL = biggest_denomination(kinds_of_coins)
  if kinds_of_coins == 1
    VAL = 1;
  elseif kinds_of_coins == 2
    VAL = 5;
  elseif kinds_of_coins == 3
    VAL = 10;
  elseif kinds_of_coins == 4
    VAL = 25;
  elseif kinds_of_coins == 5
    VAL = 50;
  endif
endfunction
