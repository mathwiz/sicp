# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex119 do
  @moduledoc false
  def sq(x), do: x * x

  def even?(x), do: rem(x, 2) == 0

  def halve(x), do: div(x, 2)

  def fib_iter(_, b, _, _, 0), do: b
  def fib_iter(a, b, p, q, count) do
    if even?(count) do
      fib_iter(
        a,
        b,
        sq(p) + sq(q),
        sq(q) + 2*p*q,
        halve(count))
    else
      fib_iter(
        b*q + a*q + a*p,
        b*p + a*q,
        p,
        q,
        count - 1)
    end
  end

  def fib(n), do: fib_iter(1, 0, 0, 1, n)
end
