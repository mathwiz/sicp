# import_file("Ex106.ex")

defmodule Ex106 do
  @moduledoc false

  def square(x), do: x * x

  def average(x, y), do: (x + y) / 2.0

  def improve(guess, x), do: average(guess, x / guess)

  def good_enough(guess, x), do: abs(square(guess) - x) < 0.001

  def sqrt_iter(guess, x) do
    cond do
      good_enough(guess, x) -> guess
      true -> sqrt_iter(improve(guess, x), x)
    end
  end

  def sqrt(x), do: sqrt_iter(1.0, x)

  def new_if(true, then_clause, _), do: then_clause
  def new_if(false, _, else_clause), do: else_clause

  def bad_sqrt_iter(guess, x), do: new_if(good_enough(guess, x), guess, bad_sqrt_iter(improve(guess, x), x))

  # will this hang? Yes
  def bad_sqrt(x), do: bad_sqrt_iter(1.0, x)
end
