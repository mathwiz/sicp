defmodule Ex110 do
  @moduledoc false

  def ack(_, 0), do: 0
  def ack(0, y), do: 2 * y
  def ack(_, 1), do: 2
  def ack(x, y), do: ack(x - 1, ack(x, y - 1))

  def f(n), do: ack(0, n)

  def g(n), do: ack(1, n)

  def h(n), do: ack(2, n)

  def k(n), do: 5 * n * n

end
