# Load with import_file("Ex101.ex")

IO.puts 10

IO.puts 5 + 3 + 4

IO.puts 9 - 1

IO.puts 6 / 2

IO.puts (2*4) + (4-6)

a = 3

b = a + 1

IO.puts a+b+a*b

IO.puts a==b

IO.puts if (b>a && b<(a*b)), do: b, else: a

IO.puts if (a == 4), do: 6, else: if (b == 4), do: 6 + 7 + a, else: 25

IO.puts (if (b > a), do: b, else: a) + 2

IO.puts (if (a > b), do: a, else: if (a < b), do: b, else: -1) * (a + 1)
