module Ex128

def divides(a, b)
  0 == b % a
end

def square(n)
  n * n
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

def fast_prime(n, times)
  if times == 0
    true
  elsif fermat_test(n)
    fast_prime(n, times-1)
  else
    false
  end
end

def fermat_test(n)
  try_it = lambda { |a| a == expmod(a, n, n) }
  try_it.call(1 + rand(n-1))
end

def expmod(base, exp, m)
  if exp == 0
    1
  elsif divides(2, exp)
    square(expmod(base, exp/2, m)) % m
  else
    (base * expmod(base, exp-1, m)) % m
  end
end

def fast_miller_rabin(n, times)
  if times == 0
    true
  elsif miller_rabin_test(n)
    fast_miller_rabin(n, times-1)
  else
    false
  end
end

def miller_rabin_test(n)
  try_it = lambda { |a| 1 == miller_rabin_expmod(a, n-1, n) }
  try_it.call(1 + rand(n-1))
end

def miller_rabin_expmod(base, exp, m)
  non_trivial_square_root = -> (x, sq) {
    test = (sq == 1) && (x != 1) && (x != (m-1))
    test ? 0 : sq
  }
  squaremod_with_check = -> (x) {
    non_trivial_square_root.call(x, square(x) % m)
  }
  if exp == 0
    1
  elsif divides(2, exp)
    squaremod_with_check.call(miller_rabin_expmod(base, exp/2, m))
  else
    (base * miller_rabin_expmod(base, exp-1, m)) % m
  end
end

def test_case(n)
  prime = is_prime(n)
  fp = fast_prime(n, 4)
  mr = fast_miller_rabin(n, 4)
  print("#{n} \t Prime: #{prime} \t Fast Prime:#{fp} \t Miller-Rabin:#{mr}\n")
end

end

include Ex128
print "Testing\n"

test_case(9)
test_case(10)
test_case(11)
test_case(71)
test_case(97)
test_case(561)
test_case(1105)
test_case(1729)
test_case(2465)
test_case(2821)
test_case(6601)

print "done", "\n"
