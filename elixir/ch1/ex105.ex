# import_file("ex105.ex")

defmodule Ex105 do
  @moduledoc false

  def p(), do: p()

  def test(x, y) do
    cond do
      x == 0 -> 0
      true -> y
    end
  end

end

# try running Ex105.test(0, Ex105.p)
# this does not return

