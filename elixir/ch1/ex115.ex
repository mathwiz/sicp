# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex115 do
  @moduledoc false
  def cube(x), do: x * x * x

  def p(x), do: 3 * x - 4 * cube x

  def sine(angle) when (abs angle) < 0.1, do: angle
  def sine(angle), do: p (sine (angle / 3.0))

end
