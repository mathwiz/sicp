# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex120 do
  @moduledoc false

  def gcd(a, 0), do: a
  def gcd(a, b) do
    gcd(b, rem(a, b))
  end

end
