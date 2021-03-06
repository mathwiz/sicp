module Ex117

def even(x)
  x % 2 == 0
end

def mult_invariant(a, b)
  if b==0
    0
  elsif even(b)
    2 * mult_invariant(a, b/2)
  else
    a + mult_invariant(a, b-1)
  end
end

def mult(a, b)
  mult_invariant(a, b)
end

end #Ex117

include Ex117
print "Testing\n"
print mult(5, 4) , "\n"
print mult(5, 5) , "\n"
print mult(5, 10) , "\n"
print mult(5, 20) , "\n"




  
