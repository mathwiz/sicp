def sum_squares(xs)
  xs.reduce(0) {|a,x| a + x*x }
end