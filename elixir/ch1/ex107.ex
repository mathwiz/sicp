# import_file("Ex107.ex")

defmodule Ex107 do
  @moduledoc false

  def square(x), do: x * x

  def average(x, y), do: (x + y) / 2.0

  def improve(guess, x), do: average(guess, x / guess)

  def good_enough(guess, x), do: abs(square(guess) - x) < (guess / 100000.0)

  def sqrt_iter(guess, x) do
    cond do
      good_enough(guess, x) -> guess
      true -> sqrt_iter(improve(guess, x), x)
    end
  end

  def sqrt(x), do: sqrt_iter(1.0, x)

end
