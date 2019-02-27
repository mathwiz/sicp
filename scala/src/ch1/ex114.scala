def biggest_denomination(kinds_of_coins: Int) = kinds_of_coins match {
  case 1 => 1
  case 2 => 5
  case 3 => 10
  case 4 => 25
  case 5 => 50
}

def cc(amount: Int, kinds_of_coins: Int): Int = amount match {
  case 0 => 1
  case x if x < 0 => 0
  case _ =>
    if (kinds_of_coins == 0) 0
    else cc(amount, kinds_of_coins - 1) + cc(amount - biggest_denomination(kinds_of_coins), kinds_of_coins)
}

def count_change(amount: Int) = cc(amount, 5)

assert(count_change(0) == 1)
assert(count_change(1) == 1)
assert(count_change(2) == 1)
assert(count_change(11) == 4)
assert(count_change(100) == 292)
println("done")
