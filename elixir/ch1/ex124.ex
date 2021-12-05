# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex124 do
  @moduledoc false

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

  #def prime?(n), do: n == smallest_divisor(n)
  def prime?(n), do: fast_prime(n, 3)

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

  def random(limit), do: :rand.uniform(limit) - 1

  def prime_test(n) do
    if prime?(n) do
      IO.puts("#{n} ***")
    else
      IO.puts("#{n}")
    end
  end

  def search_helper(n, finish) when n <= finish do
    prime_test(n)
    search_helper(n + 2, finish)
  end
  def search_helper(_, _), do: IO.puts("finished")

  def search_for_primes(start, finish) when rem(start, 2) == 1, do: search_helper(start, finish)
  def search_for_primes(start, finish), do: search_helper(start + 1, finish)
end
