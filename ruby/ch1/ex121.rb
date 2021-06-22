module Ex121

def divides(a, b)
  0 == b % a
end

def find_divisor(n, test)
  if test * test > n
    n
  elsif divides(test, n)
    test
  else
    find_divisor(n, test + 1)
  end
end 

def smallest_divisor(n)
  find_divisor(n, 2)
end

end


include Ex121
print "Testing\n"
print smallest_divisor(199) == 199 , "\n"
print smallest_divisor(1999) == 1999 , "\n"
print smallest_divisor(19999) == 7 , "\n"

print "done", "\n"
