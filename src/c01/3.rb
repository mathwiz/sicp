def larger_sq(x, y, z)
  case [x,y,z].min
  when x
    sum_sq(y,z)
  when y
    sum_sq(x,z)
  else
    sum_sq(x,y)
  end
end

def sum_sq(x, y)
  x*x + y*y
end


p(larger_sq(1,2,3))
p(larger_sq(4,2,3))
p(larger_sq(4,5,3))
p(larger_sq(4,1,3))
