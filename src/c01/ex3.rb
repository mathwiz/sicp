require_relative 'functions'

def larger_sq(x, y, z)
  case [x,y,z].min
  when x
    sum_squares([y,z])
  when y
    sum_squares([x,z])
  else
    sum_squares([x,y])
  end
end


p sum_squares([1,2,3])
p larger_sq(2,3,4)
p larger_sq(5,3,4)
p larger_sq(1,1,1)

