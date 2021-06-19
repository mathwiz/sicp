# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex121 do
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

end
