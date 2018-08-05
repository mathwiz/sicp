# import_file("Ex103.ex")

defmodule Ex103 do
  def sum_sqrs(xs), do: Enum.reduce xs, 0, fn(x, a) -> a + x * x end

  def larger_sq(x, y, z) when x <= y and x <= z, do: sum_sqrs([y, z])
  def larger_sq(x, y, z) when y <= x and y <= z, do: sum_sqrs([x, z])
  def larger_sq(x, y, z) , do: sum_sqrs([x, y])
end
