# cd("c:/Users/Yohan/IdeaProjects/sicp/elixir/ch1")
# Load with import_file("filename")
# Run with Module.func(args)
defmodule Ex114 do
  @moduledoc false
  def biggest_denomination(1), do: 1
  def biggest_denomination(2), do: 5
  def biggest_denomination(3), do: 10
  def biggest_denomination(4), do: 25
  def biggest_denomination(5), do: 50

  def cc(0, _), do: 1
  def cc(amount, _) when amount < 0, do: 0
  def cc(_, 0), do: 0
  def cc(amount, kinds_of_coins), do:
    cc(amount, kinds_of_coins - 1) + cc(amount - biggest_denomination(kinds_of_coins), kinds_of_coins)

  def count_change(amount), do: cc(amount, 5)
end

# Ex114.count_change(100) == 292
