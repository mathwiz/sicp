module Ex122

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

def is_prime(n)
  n == smallest_divisor(n)
end

def report_prime(n)
  result = is_prime(n) ? "***" : ""
  print("#{n} #{result}\n")
end

def search_helper(n, finish)
  if n <= finish
    report_prime(n)
    search_helper(n + 2, finish)
  else
    print("finished\n\n")
  end
end

def search_for_primes(start, finish)
  search_helper(divides(2, start) ? start + 1 : start, finish)
end

end

include Ex122
print "Testing\n"

search_for_primes(1000, 1020)
search_for_primes(10000, 10040)
search_for_primes(100000, 100080)

print "done", "\n"
