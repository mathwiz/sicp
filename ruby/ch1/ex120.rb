module Ex120

def gcd(a, b)
  if b==0
    sprintf("returning %d", a)
    a
  else
    sprintf("remainder %d %d", a, b)
    gcd(b, a % b)
  end
end

end 


include Ex120
print "Testing\n"
print gcd(206, 40) == 2 , "\n"
print gcd(48, 36) == 12 , "\n"
print gcd(60, 45) == 15 , "\n"




  
