defmodule Ex111 do
  @moduledoc false

  def f_rec(n) when n < 3, do: n
  def f_rec(n), do: f_rec(n - 1) + 2 * f_rec(n - 2) + 3 * f_rec(n - 3)

  def f_it(n) when n < 3, do: n
  def f_it(n), do: f_it_helper(2, 1, 0, n)

  def f_it_helper(a, b, c, n) when n == 3, do: a + 2 * b + 3 * c
  def f_it_helper(a, b, c, n), do: f_it_helper(a + 2 * b + 3 * c, a, b, n - 1)
end
