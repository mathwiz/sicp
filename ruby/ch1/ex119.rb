module Ex119

def even(x)
  x % 2 == 0
end

def fib_iter(a, b, p, q, count)
  if count==0
    b
  elsif even(count)
    fib_iter(a, b, p*p + q*q, q*q + 2*p*q, count/2)
  else
    fib_iter(b*q + a*q + a*p, b*p + a*q, p, q, count-1)
  end
end

def fib(n)
  fib_iter(1, 0, 0, 1, n)
end

end #Ex119

include Ex119
print "Testing\n"
print fib(0) == 0 , "\n"
print fib(1) == 1 , "\n"
print fib(2) == 1 , "\n"
print fib(3) == 2 , "\n"
print fib(4) == 3 , "\n"
print fib(5) == 5 , "\n"
print fib(6) == 8 , "\n"
print fib(15) == 610 , "\n"




  
