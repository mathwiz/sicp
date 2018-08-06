# import_file("Ex108.ex")

defmodule Ex108 do
  @moduledoc false

  def square(x), do: x * x

  def cube(x), do: x * x * x

  def average(x, y), do: (x + y) / 2.0

  def improve(guess, x), do: (x / square(guess) + 2 * guess) / 3.0

  def good_enough(guess, x), do: abs(cube(guess) - x) < (guess / 100000.0)

  def cbrt_iter(guess, x) do
    cond do
      good_enough(guess, x) -> guess
      true -> cbrt_iter(improve(guess, x), x)
    end
  end

  def cbrt(x), do: cbrt_iter(1.0, x)

end
