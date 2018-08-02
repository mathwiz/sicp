module Ex109
  def inc(x)
    x + 1
  end

  def dec(x)
    x - 1
  end

  def plus_r(a, b)
    a == 0 ? b : inc(plus_r(dec(a), b))
  end

  def plus_it(a, b)
    a == 0 ? b : plus_it(dec(a), inc(b))
  end
end