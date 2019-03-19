# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex116 do
  @moduledoc false
  def square(x), do: x * x

  def expt_invariant(_, 0, a), do: a
  def expt_invariant(b, p, a) when rem(p,2) == 0, do: expt_invariant(square(b), div(p,2), a)
  def expt_invariant(b, p, a), do: expt_invariant(b, p-1, a*b)


  def expt_inv(b, p), do: expt_invariant(b, p, 1)

end
