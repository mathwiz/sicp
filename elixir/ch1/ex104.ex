# import_file("ex104.ex")

defmodule Ex104 do
  @moduledoc false

  def a_plus_abs_b_fun(n) when n < 0, do: fn(x, y) -> x - y end
  def a_plus_abs_b_fun(_) , do: fn(x, y) -> x + y end

  def a_plus_abs_b(a, b), do: a_plus_abs_b_fun(b).(a, b)

end
