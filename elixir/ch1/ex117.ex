# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex117 do
  @moduledoc false
  def double(x), do: x * 2

  def halve(x), do: div(x, 2)

  def even?(x), do: rem(x, 2) == 0

  def mult_invariant(_, 0), do: 0
  def mult_invariant(a, b) do
    if even?(b) do
      double(mult_invariant(a, halve(b)))
    else
      a + mult_invariant(a, b - 1)
    end
  end

  def times(a, b), do: mult_invariant(a, b)
end
