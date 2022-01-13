# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex128 do
  @moduledoc false

  def random(limit), do: :rand.uniform(limit) - 1

  def sq(x), do: x * x

  def divides?(a, b), do: rem(b, a) == 0

  def smallest_divisor(n), do: find_divisor(n, 2)

  def find_divisor(n, test_divisor) when test_divisor * test_divisor > n, do: n
  def find_divisor(n, test_divisor) do
    if divides?(test_divisor, n) do
      test_divisor
    else
      find_divisor(n, test_divisor + 1)
    end
  end

  def prime?(n), do: n == smallest_divisor(n)
  
  def fast_prime(_, 0), do: true
  def fast_prime(n, times) do
    if fermat_test(n) do
      fast_prime(n, times-1)
    else
      false
    end
  end

  def fermat_test(n) do
    try_it = fn (a) -> a == expmod(a, n, n) end
    try_it.(1 + random(n - 1)) 
  end

  def expmod(_, 0, _), do: 1
  def expmod(base, exp, m) do
    if divides?(2, exp) do
      rem(sq(expmod(base, div(exp, 2), m)), m)
    else
      rem(base * expmod(base, exp-1, m), m)
    end
  end

  def miller_rabin_expmod(_, 0, _), do: 1
  def miller_rabin_expmod(base, exp, m) do
    nontrivial_sqrt = fn (x, sq) ->
      if sq == 1 and x != 1 and x != (m-1), do: 0, else: sq end
    squaremod_with_check = fn (x) ->
      nontrivial_sqrt.(x, rem(sq(x), m)) end

    if divides?(2, exp) do
      squaremod_with_check.(miller_rabin_expmod(base, div(exp, 2), m))
    else
      rem(base * miller_rabin_expmod(base, exp-1, m), m)
    end
  end

  def miller_rabin_test(n) do
    try_it = fn (a) -> 1 == miller_rabin_expmod(a, n-1, n) end
    try_it.(1 + random(n-1))
  end  

  def miller_rabin(_, 0), do: true
  def miller_rabin(n, times) do
    miller_rabin_test(n) and miller_rabin(n, times-1)
  end  

  def number_test(n) do
      IO.puts("#{n}: \tPrime:#{prime?(n)} \tFast Prime:#{fast_prime(n,20)} \tMiller-Rabin:#{miller_rabin(n,20)}")
  end

  def test_cases() do
    number_test(10)
    number_test(11)
    number_test(561)
    number_test(1105)
    number_test(1729)
    number_test(2465)
    number_test(2821)
    number_test(6601)
    number_test(6603)
  end
end
