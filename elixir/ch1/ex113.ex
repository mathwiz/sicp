# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("ex113.ex")
# Run with Ex113.fib(n)
defmodule Ex113 do
  @moduledoc false
  def psi, do: (1 + :math.sqrt(5)) / 2
  def phi, do: (1 - :math.sqrt(5)) / 2

  def fib(n) when n < 2, do: n
  def fib(n), do: round((:math.pow(psi(), n) - :math.pow(phi(), n)) / :math.sqrt(5))
end
