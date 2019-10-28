# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex117 do
  @moduledoc false
  def double(x), do: x * 2

  def halve(x), do: div(x, 2)

  def even?(x), do: rem(x, 2) == 0

  def mult_invariant(_, 0, a), do: a
  def mult_invariant(b, p, a) do
    if even?(p) do
      mult_invariant(double(b), halve(p), a)
    else
      mult_invariant(b, p - 1, a + b)
    end
  end

  def times(a, b), do: mult_invariant(a, b, 0)
end
