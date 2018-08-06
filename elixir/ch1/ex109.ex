# import_file("Ex109.ex")

defmodule Ex109 do
  @moduledoc false

  def inc(x), do: x + 1

  def dec(x), do: x - 1

  def plus_r(0, b), do: b
  def plus_r(a, b), do: inc(plus_r(dec(a), b))

  def plus_it(0, b), do: b
  def plus_it(a, b), do: plus_it(dec(a), inc(b))
end
