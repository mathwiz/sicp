# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex122 do
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

  def prime?(n), do: n == smallest_divisor(n)

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
