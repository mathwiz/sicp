#=
ex105:
- Julia version: 0.6.4
- Author: Yohan
- Date: 2018-07-31
=#

function p()
  p()
end


# when run with test(0, p())
# produces StackOverflowError
function test(x, y)
  x == 0 ? 0 : y
end