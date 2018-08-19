# Load with import_file("ex112.ex")
# Run with Ex112.pascal(r, n)

defmodule Ex112 do
  @moduledoc false

  def pascal(r, 1), do: 1
  def pascal(r, n) when n == r, do: 1
  def pascal(r, n), do: pascal(r - 1, n - 1) + pascal(r - 1, n)
end
