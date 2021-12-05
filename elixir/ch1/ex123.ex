# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex123 do
  @moduledoc false

  def sq(x), do: x * x

  def divides?(a, b), do: rem(b, a) == 0

  def smallest_divisor(n), do: find_divisor(n, 2)

  def next(2), do: 3
  def next(n), do: n + 2

  def find_divisor(n, test_divisor) when test_divisor * test_divisor > n, do: n
  def find_divisor(n, test_divisor) do
    if divides?(test_divisor, n) do
      test_divisor
    else
      find_divisor(n, next(test_divisor))
    end
  end

end
