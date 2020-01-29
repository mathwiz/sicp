module Ex117

def even(x)
  x % 2 == 0
end

def mult_invariant(a, b, acc)
  if b==0
    acc
  elsif even(b)
    mult_invariant(a*2, b/2, acc)
  else
    mult_invariant(a, b-1, acc + a)
  end
end

def mult(a, b)
  mult_invariant(a, b, 0)
end

end #Ex117

include Ex117
print "Testing\n"
print mult(5, 4) , "\n"
print mult(5, 5) , "\n"
print mult(5, 10) , "\n"
print mult(5, 20) , "\n"




  
