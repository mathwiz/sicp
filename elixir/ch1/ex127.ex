# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex127 do
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

  def carmichael?(n) do
    try_it = fn (a) -> a == expmod(a, n, n) end
    !prime?(n) and do_carmichael(n-1, try_it)
  end  

  defp do_carmichael(0, _), do: true
  defp do_carmichael(n, tryFn), do: tryFn(n) and do_carmichael(n-1, tryFn)

  def number_test(n) do
      IO.puts("#{n}: \tPrime:#{prime(n)} \tFast Prime:#{fast_prime(n,20)} \tCarmichael:#{carmichael?(n)} \n")
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
